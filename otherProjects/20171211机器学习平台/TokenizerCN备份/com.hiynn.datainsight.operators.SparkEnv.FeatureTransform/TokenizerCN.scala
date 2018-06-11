package com.hiynn.datainsight.operators.SparkEnv.FeatureTransform

import com.hiynn.datainsight.operators._
import com.hiynn.datainsight.parameters._
import com.hiynn.datainsight.parameters.conditions.ParameterConditionNotEmpty
import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions.{col, udf}

import scala.util.{Failure, Success, Try}

class TokenizerCN extends Operator {

  override protected val inputPorts = Set( "in" )
  override protected val outputPorts = Set( "out" )

  override def createParams: Parameters = {
    super.createParams

    val notEmptyCheck = new ParameterConditionNotEmpty[String]()

    Try {
      val params = config.get( "params" ).getAsJsonObject

      /**
        * inputCol: 输入列
        */
      val inputColValue = StringValueType( params.get( "inputCol" ).getAsString )
      val inputColCond = List( notEmptyCheck )
      setParam( new ParameterType( "inputCol", inputColValue, inputColCond ) )


      /**
        * outputCol: 输出列
        */
      val outputColValue = StringValueType( params.get( "outputCol" ).getAsString )
      val outputColCond = List( notEmptyCheck )
      setParam( new ParameterType( "outputCol", outputColValue, outputColCond ) )

    } match {
      case Success( _ ) => parameters
      case Failure( e ) => throw e
    }

  }


  override def compute(): Unit = withIn {

    val uuid = getParam[StringValueType, String]( "uuid" )

    val inputCol = getParam[StringValueType, String]( "inputCol" )
    val outputCol = getParam[StringValueType, String]( "outputCol" )

    var inPortDataFrame = OperatorResult( getResult( "in" ) ).asInstanceOf[DataFrame]

    val tokenizer = new org.apache.spark.ml.feature.TokenizerCN()
      .setInputCol( inputCol )
      .setOutputCol( outputCol )

    val countTokens = udf { (words: Seq[String]) => words.length }

    var tokenized = tokenizer.transform( inPortDataFrame )

    cacheMetaAndSample( uuid, "out", tokenized )
    putResult( OperatorOutputPort( "out" ), DataFrameResult( tokenized ) )

  }
}
