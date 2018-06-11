/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.spark.ml.feature

import org.apache.spark.annotation.Since
import org.apache.spark.ml.UnaryTransformer
import org.apache.spark.ml.param._
import org.apache.spark.ml.util._
import org.apache.spark.sql.types.{ArrayType, DataType, StringType}
import com.huaban.analysis.jieba.JiebaSegmenter

import scala.collection.JavaConverters

/**
  * A tokenizer that converts the input string to lowercase and then splits it by white spaces.
  *
  * @see [[RegexTokenizer]]
  */
@Since( "1.2.0" )
class TokenizerCN @Since( "1.4.0" )(@Since( "1.4.0" ) override val uid: String)
  extends UnaryTransformer[String, Seq[String], TokenizerCN] with DefaultParamsWritable {

  @Since( "1.2.0" )
  def this() = this( Identifiable.randomUID( "tokCN" ) )

  override protected def createTransformFunc: String => Seq[String] = { originStr =>
    val segmenter = new JiebaSegmenter
    val segList = segmenter.sentenceProcess( originStr )
    JavaConverters.asScalaIteratorConverter( segList.iterator() ).asScala.toSeq
  }

  override protected def validateInputType(inputType: DataType): Unit = {
    require( inputType == StringType, s"Input type must be string type but got $inputType." )
  }

  override protected def outputDataType: DataType = new ArrayType( StringType, true )

  @Since( "1.4.1" )
  override def copy(extra: ParamMap): TokenizerCN = defaultCopy( extra )
}

@Since( "1.6.0" )
object TokenizerCN extends DefaultParamsReadable[TokenizerCN] {

  @Since( "1.6.0" )
  override def load(path: String): TokenizerCN = super.load( path )
}


