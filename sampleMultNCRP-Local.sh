#!/bin/bash

BINARY=/scratch/cluster/joeraii/ncrp/sampleMultNCRP

DATAFILE=$1
DEPTH=$2
CRP_ALPHA=$3
CRP_ETA=$4
SEED=$5

SHORN_DATAFILE=${DATAFILE##*/}

RESULTS_PATH=RESULTS_NCRP
BASE_RUN_PATH=RUN-$SHORN_DATAFILE-DEPTH$DEPTH-$CRP_ALPHA-$CRP_ETA
FULL_RUN_PATH=$RESULTS_PATH/$BASE_RUN_PATH/$SEED

ORIGINAL_PATH=`pwd`

mkdir $RESULTS_PATH
cd $RESULTS_PATH
mkdir $BASE_RUN_PATH
cd $BASE_RUN_PATH
mkdir $SEED
cd $SEED

#GLOG_logtostderr=1 GLOG_v=2 $BINARY --ncrp_datafile=$ORIGINAL_PATH/$DATAFILE --ncrp_alpha=$CRP_ALPHA --eta=$CRP_ETA --ncrp_depth=$DEPTH --sample_lag=100 --random_seed=$SEED out
GLOG_logtostderr=1 $BINARY --ncrp_datafile=$ORIGINAL_PATH/$DATAFILE --ncrp_gamma=1.0 --ncrp_alpha=$CRP_ALPHA --eta=$CRP_ETA --ncrp_depth=$DEPTH --sample_lag=5 --random_seed=$SEED out
