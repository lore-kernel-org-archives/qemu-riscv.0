Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD9C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHq5-0002nP-Jj; Thu, 02 Jul 2026 09:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq3-0002lj-E5
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHq1-0008CW-WD
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:23 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0aAc406396
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=; b=SvR5x8eYGJ66QRyH
 4I6s1QzzHKrIYvOlqYxmBuMMQtSmgl3UlcR9tDEJ5mXBQKjXKelqc5TMraxJQxFJ
 AAmFLJclVFKOpI4wsx4cgFVmA+TebY3dYP6mDN0a34LbO9yoi11L9oCKJtT81ZtI
 2kpZ6mQ7VucK5DMD7Zmda/i6t37uHopa6pSday3v46NgshQ2kShCN0YffZsuatIR
 76YtjE4omXEek6vjt3bSoYjkyEevLhdTKpe7hzsi2mW4gATI4SGECls3CeDm+z6e
 2PU4yGTHHEbN0CHlmqG63TAWDwZVAqZzWM61w+X12nrg5/fTZC4pYvctJQ3Qg9K6
 oRxBsg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98j11g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-964172af027so1794227241.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000330; x=1783605130; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=;
 b=BDkSDdpZ38x/Q+g2JUDZg3DK+1Lda64GhQpXr6hum36aAlS8hSPMXpXu4G8TRKF8bD
 Oz0Jf7em3EUMsDoxoWcfAh8xAVgChskWS4TLqnCvXckA59VEvZhIoBAD64vFGxdMXHHU
 90XqWJT8Zb2H7th9RI6UXKUVuYgONvUYpJgu8VARFBp4mJWBb7hbIzMLRwpBD1UGWv+R
 Arjx9q71F7dz/AVAFefqjuxeN5svQMtRauu6F8JFYv+RDtI3lQjfX7bg9fAhcd+7LsGS
 EKfwCfet9c6h0eG3seqCebQPeMssOeWdNGTdS9iZH+agz391bILIwFc6ZVYPt+6jEWwZ
 JRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000330; x=1783605130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gmpzB82DGE/aV8td0WaB+C5BqZ48rvErCbJFfP3xpEU=;
 b=GCZ0SPw+4nZAagp4ayEjraxVB9TJhSKKv9r5DtD7Pn4TUpHKYCXKhSWf79OyO623rx
 igRB68G+X5kSGOEewIPX3uEvg6w3WQKMU8GUMEgxW6mlTbBIfBrU+4bS3nD5V4AqTZ1L
 UDByXgJAFa3a3g2ABsSjuNB5Hg6+6YWLFjMwSHmdLcX/yaA4R5ybTA/jzus3FbllKNpY
 rKv9KoX9GDCenhhSB2WapIK9LBA/jK4MnawCfjOIpWs4l3AcQjYIuYVF+3e8WQSEf5Vf
 eZlOtp3NoECroQNWKsCdkszTeeFydtd4waeF8LXTykGlLslfxt1rTkqzVlTv/glxxxWn
 gIOA==
X-Gm-Message-State: AOJu0Yw2laBCqf82V44e7Dc2CDSEfzS3IinAmtMetYgSSmQuU6sUnrcB
 VSIvHvbq55cW5ESF6YuNw3XkrJ5th8ccthIzEK8H/C4SUNfZ0VZYoYOOi1vU0Ht+z0JyAY6ekfS
 HuTsWcWwfs5Z6dfrlqoj/9tpWYuiHdHguA0phdHL2b/vc1LhJcb5TuZDM2A==
X-Gm-Gg: AfdE7clQY2IUP4r9ua5PVcUkzX3OmBBIn7CqFUjYSHDtXvm7iWD5GA5uOREECXo//Tm
 MmDIxnaXid88QiEpw7a1htDjHkSNofvsHaU2xyRJn8lC//rC/kFP7h3wFIqOjfulaO11ySjAGY6
 0vzAGLh1ImX2W1gU3UQXj0iuTfhvmhuU1li2l0W8RZpboIovW009q6X8nWkrfc6wzUEnTBjIs3C
 jQes6cfoaBAoiEo95ObYh2HWtUtm2C4YuKKAGkziAnY9KZgd983u4+YWz7aI9nrhnVv4+561h2A
 hLl2HkKHLEAPLZeb9kowmCYOenr+RNXMnRVnGG10q8fzJWkMrfpXXhWaJKb2zkAC39nkmAx5lhG
 JhnL/W1ZJfEot1G0bu8D7iSG7UaI99P2oEsbB0Az8ojtIow==
X-Received: by 2002:a05:6102:6c8:b0:739:5c3d:605f with SMTP id
 ada2fe7eead31-73da7cc9120mr3380560137.9.1783000330221; 
 Thu, 02 Jul 2026 06:52:10 -0700 (PDT)
X-Received: by 2002:a05:6102:6c8:b0:739:5c3d:605f with SMTP id
 ada2fe7eead31-73da7cc9120mr3380545137.9.1783000329816; 
 Thu, 02 Jul 2026 06:52:09 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:09 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 14/24] target/riscv: move riscv_cpu_claim_interrupts to
 cpu.c
Date: Thu,  2 Jul 2026 10:51:16 -0300
Message-ID: <20260702135128.1188021-15-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pXP2IEZ3HBsdw6uyC5RzaiKfQ1fKHcnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX4TE48HCIxuyD
 nuV74RzftbvzDL1NizX1kSKeM0uuklOUo42Wloa46XL4VKbqIIf6ntKweP+rP5cS6ddkxuD+Lc+
 QVNVgGbLzI6S9WXJRlaMPzO8S2PYciDh8j8CDNArAF986Fd25RRt65qZDJUix4mRV57UXg0iC4j
 2ey7RUYMSgbHn4ZyJSHDTcYV8dun90usYPzJM3FCzxq+Zs7zHE/NqebKkeSm79ES3XdgSCsRsdO
 mz2SCgNvSphXGUJqpljMZMQHDcTP1gN3p16euvducFLOgrianFXkbGWbtT83q5p+n4zif0CSMuL
 +cVNNDiMxd8yyYdOq5/xAq8mfbnNDcYHH49vZG1rmADniWv6eZCHJTBr3xTqOuOQoycvb9LCyeX
 Al1/QloZVZtSltRJWXQqZwrozewINfPL6YJ9H+htLvKFfe3d8+iXK7bH9KTv5bcwznynwqADCMT
 Z4x2bQEbca9ibWCCmEA==
X-Proofpoint-GUID: pXP2IEZ3HBsdw6uyC5RzaiKfQ1fKHcnr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6Uar7UcgP+J1
 /ChMQg4Lpvr/POTi9oF1CHEFNtf2VCHkpW0ZYXEqgnWHcqp56V18ePQW6+i9uO/7QGJz7zzbNCx
 /OWXiSwfkcI8G82VQAzkDKxk+oKVGhs=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a466d0a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=P7v9EdgfUgEVytVI3b0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The function is used by hw/intc/ files that KVM cares about like
riscv_aplic.c.  Move it to cpu.c to be accessible for --disable-tcg
builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c            | 14 ++++++++++++++
 target/riscv/tcg/cpu_helper.c | 11 -----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fe24751379..2741047769 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -573,6 +573,20 @@ target_ulong riscv_new_csr_seed(target_ulong new_value,
     return rval;
 }
 
+#ifndef CONFIG_USER_ONLY
+/* Used by lots of folks in hw/intc */
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
+{
+    CPURISCVState *env = &cpu->env;
+    if (env->miclaim & interrupts) {
+        return -1;
+    } else {
+        env->miclaim |= interrupts;
+        return 0;
+    }
+}
+#endif
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 250bb20481..aded995a7f 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -572,17 +572,6 @@ void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
     }
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
-{
-    CPURISCVState *env = &cpu->env;
-    if (env->miclaim & interrupts) {
-        return -1;
-    } else {
-        env->miclaim |= interrupts;
-        return 0;
-    }
-}
-
 void riscv_cpu_interrupt(CPURISCVState *env)
 {
     uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
-- 
2.43.0


