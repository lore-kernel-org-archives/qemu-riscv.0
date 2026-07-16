Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9E5C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKO-0003LF-Vb; Thu, 16 Jul 2026 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKN-0003KM-3Q
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKL-00078x-GD
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:34 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiX9c2475200
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FNFsdtnL58j
 EJT/xn7xwIBtZivm2KGli4fv3zj95Ick=; b=A3LiGf5awyKJRYwQCpcC8nbT47P
 nh318CAl8kA1N7kC+AQv9BxZzxIvS6nr4GaGSh8dvSSPawcspt9XR+I6G/VPE352
 ce1XUw2TEvz6cWCW/nAfofRQHBE7hkbirYziKdCcOC3mrJ2HQkq29PfyiP5mwz7b
 UTt2d1BY3wUVqD/YJDWvs08qhNKUz/GOck157n4QCtxaJg01ncACaEnv6HMxLhzt
 +8hK3HVYq7mlYWTXwfYeeUIu+l9P0TfTvu3z4GWPujidnLRKPyxpd61+W3c1cb7f
 +0480t526Q2avuN/zF3XeG7AUUwm6HF3pnE3ysEoLvvVOqaxJR75yhN2dgA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7scge-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so151289656d6.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205380; x=1784810180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FNFsdtnL58jEJT/xn7xwIBtZivm2KGli4fv3zj95Ick=;
 b=JU3dJfGmfj5GvBZgDH/7VDp2avzoFPtdmVIsy8qZj/X1BaCT5qsCW19TsQaz3rJ+TB
 Y8u9KYZrS7otUm7i6gRrCuEVKtunu3mvc3+WkzWd0tnJ3zRpPPgjqAxxde3iwZuHX7Bp
 ykgC2x6qmIq7pzDI/2wl0fnjxMvBAnk5jWiznpOVaXejFUi1BzrJtyPptPPmLp6qBswb
 UEdm5+o2M+XXJvMMWgvL5PITTaABrRbXmTwNLzFMArZteOkov6hR0Yx5DMvo5xdJJhYC
 jcUkcUeu8rAGoGZngsaJ2Din8LQtLTb3qNtp5/iSrRZWgoEk8/+BwQ/ZoQ8sdTyHNTz/
 N5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205380; x=1784810180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FNFsdtnL58jEJT/xn7xwIBtZivm2KGli4fv3zj95Ick=;
 b=A/DPWxo/ENX7FCTNrh4p2NjOt/6Ko4GZMPDQEyd0E2hIcNoRaL6RsvrSgu13jVG2SX
 +4fk2T0oWPW0qeQjOJIlT0bON7FkOKMMPL09a+/lPtyWxzITAzBqID6iLO7xsFI/sffo
 BCKkaSHOuIUhgm/27qxIkm7LJOCgyJt8109hKUb2Pa1E8Ng3FKGc7mNBCyvctAgodbC+
 YYqVbjqKRDGn29lGcvhyT9jryTrvb88pK26k6DFn9SGW+T5dv9jecrHTzjAqOi/tXE0X
 Q2E/Q1BVQsEBZBvfDRmi6tKQh1N6B2U95QragWwVjcw8Xw6IGyH5ZQr9QDGJvoTFrQWq
 /H9w==
X-Gm-Message-State: AOJu0Yw9Y8fvfK5gHlbDhD9rOY2GdL+URdC+aUIjABSScnTPtXUnjbj/
 lHnUN8MiASKynKP6gHfhMc2FX3hAEbizcv7NfOxkixryoGLNkqRIdjkorQycDdIahLJFT7K7s3G
 /+01HeFpUMPlKuE7pz+/5woE3jqdqOrC9339PY41gUVoBvSZat7DCP1OpSA==
X-Gm-Gg: AfdE7cmDM8l6n7P0m5fYEPd1iDMgUaauXoefGFntsjX05bD5rB3/6TLaj0VFhC75w01
 b63p8llHGYqamcsFWmli4F4yj4WX14vSBdsqPEPisx330z6y1Qn9TKAcl3g+f3uFT5SZN1N9QKU
 RFlkzdhIr37y7c3j8vvRRoUU3N9bGD7q/+fYfNTzq78f1JZORSfue9FI7xSHv4SCj+rJPcgEed9
 to2ke/OhD9irS5nvRVMZw+0VPtyB8adVcuRlehaGQ1yEDjaXgyb+aJRpvUJAiFOTGDj9lT7kiim
 gAMdZiZ/cOpQCEtwYMBi1Sz06UTQP0qyQ/l4pTYSrjJV5+SGiNZ9TuDh4r5GXGPUHvcS0db9WEu
 FwyIiLgKp5pkC2sYGhH6Z0k17kMNmmmTSquA=
X-Received: by 2002:a05:6214:2e48:b0:8f4:6ffb:cb78 with SMTP id
 6a1803df08f44-90758d0d39fmr73989086d6.22.1784205379695; 
 Thu, 16 Jul 2026 05:36:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2e48:b0:8f4:6ffb:cb78 with SMTP id
 6a1803df08f44-90758d0d39fmr73988426d6.22.1784205379018; 
 Thu, 16 Jul 2026 05:36:19 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:18 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 14/17] target/riscv/debug: Insert breakpoints after
 migration
Date: Thu, 16 Jul 2026 09:35:31 -0300
Message-ID: <20260716123535.3709148-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX8UyR5ZQDGxZ7
 DCREyRKc3zwNoxxSOMd9gcaqDlKujDR7glG3WZUipiCGfLzmGl6hvjI3ueg9LZPUkWggvc006uW
 KwAWDkdkQIoZrNHHo9NTOFSa5RBzieU=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58d044 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=N90MVQWl6141f43dwBUA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6cCDm6HPqKEf
 DkiybeEIFffFkrAeWC44sBrlt28MbWPvmWBHMmyjpaL01lN891XAU9aqWB87NV63ZJDCvvH4KbY
 SmP22mX0Ji93mVnbBTKDKUSt/omYP5VEfNLEwXkCKz4sZbc685UvF0l3T6DdGJ/mLcVYQ5a8Lsi
 nNvf18BvDAqFdde4eD3jCCnsg+PrPQsL+Gdby3zugAGP7c9Gk5ujgFIxNmpzxbgIZq6rT0lwkfa
 LFA3gtZDdoaPozvjp1uNkWIlmbHQ5204Wzi6m+khY65EVoEQxExZmeBNDYxVutzWamyu3/CTlLX
 x994NxB57ih+qR4Z5XksVZG6LYyM9ZPqZdJxqt4vm8abYbPy19mfy+6dyIlu7nCKAMY82QYb3Tk
 TxKzEn9sa47xH0JzeXcuutyP7WwG2Q7THTTP6sDATNaw9TTViqDoLIl4R9YqwTQikt7ka8Rm4xy
 fFXRkhG3mb3UjmBIWXA==
X-Proofpoint-ORIG-GUID: odwF4aliiIMTS5_awH_c4Jr06OSJ2PXo
X-Proofpoint-GUID: odwF4aliiIMTS5_awH_c4Jr06OSJ2PXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

After migration, TCG breakpoints should be re-established based
on debug register state.

icount trigger timer in the icount_enabled() path is also missing,
but that path will be removed subsequently so don't bother to fix
it.

Fixes: 577f028694 ("target/riscv: Add itrigger_enabled field to CPURISCVState")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 56f9ceb042..09d4cc03f9 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1157,6 +1157,20 @@ void riscv_cpu_debug_change_priv(CPURISCVState *env)
 
 void riscv_cpu_debug_post_load(CPURISCVState *env)
 {
+    for (int i = 0; i < env->num_triggers; i++) {
+        int trigger_type = get_trigger_type(env, i);
+
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            type2_breakpoint_insert(env, i);
+            break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            type6_breakpoint_insert(env, i);
+            break;
+        default:
+            break;
+        }
+    }
     if (!icount_enabled()) {
         env->itrigger_enabled = riscv_itrigger_enabled(env);
     }
-- 
2.43.0


