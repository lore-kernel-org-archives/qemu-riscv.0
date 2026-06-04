Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C01CD6E57
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:54:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4lF-0005UP-IJ; Thu, 04 Jun 2026 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4l6-0005SL-VE
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4l4-0003hh-H9
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:53:03 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6545k8Tx1039271
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tjcJ28mFinE
 xTdQkLHGFFBxaKcXZG06GkSkZCcUr+IA=; b=hZ8933vxbSyuJSh6epnSwdex7Vb
 Umx+MAw45Qpma2T/aJrw5y83KmdI+fveEf7B8DKYiRNRc+axh7Dchg+fRUuyZjTh
 9JpnY+Iumfj2HMwkTiVq6cTYhKvyIlyy5Bj0zTwMYpp1nKMDVtTi9m/lcCTUAhZ7
 A6Rp4frRqIMXZgciql5/nvcqEXRhkDnbA89qYXqsdRKi7mACETpwVtmPXY1D0jzg
 GJ4ghNrC8j2giSs5lsuCDixVT4sPO4yTvR1JrH5q2LZjszlkDTjXq6zF6IzwOfjd
 No6hOCq6Wq+TzARvIU/vS7cWigrO6sW9injd/e6dZ/hG07Amls35WVP3Aug==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8jrcx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:53:01 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66077c3f223so846012d50.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566780; x=1781171580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjcJ28mFinExTdQkLHGFFBxaKcXZG06GkSkZCcUr+IA=;
 b=PdxC499qvShdHKa1pDS7wxLH625THegWvIbiaDPUEz8AKfw8mxEaJw/S3BBmlRKnmh
 5Qg1LSK6j1C8qsIl4v1KgrOuP0D1KGs3o5KvpkjwZkoT82eWwz52ZQ3LnnB2Cpior7fn
 nYfjPaGOvhqOZ9YTvDW90iF3Goj7mqkqMrH+kwsAPNIo1D9TNPHibJ/CGN3751fnjT1i
 ohh9kErUzyNePVz5Z6yton33r8bI2ugn6svXRClqNfSVpgPcgUxHWSQTev6XCAkSnb4j
 Xl7t+2vE3q3lizNWkBrAS/TyWyDEyAU96LDAgHNyhZQliAFd953r0v/o+nxAJDHIXxLL
 QOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566780; x=1781171580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tjcJ28mFinExTdQkLHGFFBxaKcXZG06GkSkZCcUr+IA=;
 b=Ttbyqxj8JE1Q0etES85O3UjxetcPojxPspDXDrDA3VZTQO5gIVVeGwl29WEjKJEDkn
 kgfwHHJBAXqCqmgVS7hiqolLMJ52LFQluRVy+1e0sA06FHng3XDHgELRCYdrhk6k5epe
 quyg1jLr3yw9YK+Lb6dwiUbzQ0q2HYDbiepmkFsAVRoos2VOAR3J2H1IWQ3uoJNHh228
 qt9RcY2AkOZ6R9GNP5f5kfdH9Xzl7dsAqskv/Sz8X+bdV3MBaYygc7uVXlxSja//ixtg
 p/BLvJn1A2Kk/YXjLyLXWfVvb1eJfKfrZIoCiUXGK8Y8OkFuYqq7QtSVLNsaeGEpGKYS
 f+5A==
X-Gm-Message-State: AOJu0YxS1/PG+lEhdVwJmPbvp0yyYlYSmOxdSWaiClVw8qXFfuAf6UJB
 MK8F1GQpPZzSWToedO0AxOf11JyzrdGCo7abgKpEPhwr01olPhrQyb4f0fXOg61k0GNUFd+Ed1b
 3owZVwlXzmMj1X+geoiavi5ORnii7XkgO5MES+q3G6iDm1bctCEAduWSyQQ==
X-Gm-Gg: Acq92OGYbgj6eJ4XXBBPQIAzPBi162HkIbo4BNbXd/02E4cVseCmC9YOpMhJBMFARGu
 2kNWBlCApurYISaxR7qExdxj34SrQ2CYYsugMexdcYgKe6vI0BuODGJhUMEl+o9bbNRZExmbDFN
 SD95SjXn9VY6+QgL6vL3ZaBxcBXlAr8ZdwFdMyWbrbzeSKb5JujcULg8TDZHf3xnItU6boxovuu
 H/uFmP/WQ0JoMrKXg6kVpDTWUzVDFnCZZYrCpNLhJKjvNPMqfHr4PB1DhB/cZp5Yzk0wGSXiEy6
 5lwRWc1IQEyBrENXICjNG8smGceU17THKz4gFfE69TfDKJw8pv/xI5yuCYqzRf1GyBmKkSL4zp0
 5xE4XKisgsBD8nkwxY7hvqwoe+FvZTEx0B2qrvvqUOXdTs5qRUYmHZxgYaX1eprlvSvnHsw==
X-Received: by 2002:a05:690e:4384:b0:652:ddea:1679 with SMTP id
 956f58d0204a3-660dbfc0251mr4376575d50.16.1780566780295; 
 Thu, 04 Jun 2026 02:53:00 -0700 (PDT)
X-Received: by 2002:a05:690e:4384:b0:652:ddea:1679 with SMTP id
 956f58d0204a3-660dbfc0251mr4376566d50.16.1780566779935; 
 Thu, 04 Jun 2026 02:52:59 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-660d64ba680sm3522830d50.21.2026.06.04.02.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 02:52:59 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v7 1/5] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Date: Thu,  4 Jun 2026 06:52:40 -0300
Message-ID: <20260604095244.3313259-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mYVxbPl3iY-qqKemiPFXfr2bZAQuDVjX
X-Proofpoint-GUID: mYVxbPl3iY-qqKemiPFXfr2bZAQuDVjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5NSBTYWx0ZWRfX23BStyExOw+R
 PuMkDitdZ+0RZb6EqWX3/tPrv1Fuo8t8oyD8ydy5ah2DOB+WN3FTJ394gURonJl3xHsaczuFnub
 ix9Kqg2m4nsMbXqLYBEeNAel2oE69Wi0klkusjv3ezCtpxTT7IcbHGVD/mBa2lEAlwu9It6T2kE
 bZCqQXhdqNwj9v/Ks8dQBM3r7Qbrd/DTAKUWU5t2FIdRePNU1XvZXghv9/n6cQVMDrWXW8Gukqq
 2UHMl1gjgrNADitzQ+DFmk5+SJGUhwjbXa6JIytZN3AcEFCIz9bJX4IvEczt2Drhl5EYpMgFdnW
 vy55tfRyDio+tOzMku7sLkL0JcG5mii52VXuJnDb2jHkZj0rPlDJu75hMxYmQNLve9eNh8mwT5s
 BVgnyRUnKhRoAvHD5lp7BghFWS9R5bHHEtBKOkqHwAk3WZRBGLEF95zykmtoFljSKrE/A7wdLri
 B+ZD0JYFH8jbC+s/Vdg==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a214afd cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=GhL2bEVCvcqOW28JNKkA:9 a=yHXA93iunegOHmWoMUFd:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040095
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We want to configure other CPU types to use profiles as an alternative
to adding every profile extension explicitly, i.e. a profile is nothing
more than an extension bundle.

This means that a vendor CPU can set .profile=rva23s64 while having the
same handling as any other vendor CPU. Same thing with all other CPU
types.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3b5d4c94c..3f0f931335 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2737,7 +2737,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
         mcc->def->bare |= def->bare;
         if (def->profile) {
             assert(profile_extends(def->profile, mcc->def->profile));
-            assert(mcc->def->bare);
             mcc->def->profile = def->profile;
         }
         if (def->misa_mxl_max) {
-- 
2.43.0


