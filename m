Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88234606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 23:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oZFSech0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbnEnH0/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJfW6-0007fu-Fn; Wed, 21 Oct 2026 19:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfW1-0007cD-F1
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJfVy-00051P-52
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 19:14:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LKeDul2748412
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=umQBs0jc4pQ
 gaMYkFT6HH+2iJmSyQyXzAG5XzBVFQBA=; b=oZFSech0MJHG7oaNLTIHIX+nzRw
 MRm0nu473qVgd5NydQjXcmTn5Jd7tbbNGea4e/z3tGWz6fv7J58kAarH1spqPyK+
 XXU9HuLLrcPcqfcWZCgp/NnJyGtIU5mndEc/b+yZ3JDhfITLGkjncSaqAC984IUV
 slv9QORS+blqzyydBMpdiUlJsTDreaxutFijTyWj9UeDsnCtEfWOzgrZCW8GJ7hb
 9/h+rJ3ru9YpmG5O65bsZVuuIisMNBh7GxbbeR6Eax3b/M7cFL+u7qz+YvE1uvtI
 KntABAIKrwy9fpRs3c3s7EOp7AoZgFH7VaLNzmHf4vuuEUK+6RZO8jrXNhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke1h15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 23:14:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5338974c0ceso36630511cf.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792624471; x=1793229271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=umQBs0jc4pQgaMYkFT6HH+2iJmSyQyXzAG5XzBVFQBA=;
 b=BbnEnH0/QoovERXnGOOKE6P/MbKFkBUPVZR0WsOiRZyUdcP4soWqAuk5LJmq0+uD/O
 VOGnHOiDdTn699oiWL4LzFy4GIhQE5OJyeplHl0adWscRf59OyWoe9U8ih6r3Lfi9jSu
 bvJv/0aFdblFCGiDaMnBfMMOURXnv0RJvtwb12hlTEfuG+gS3uT4JmrhoQOocka4VKqG
 9rztfaAIE60t2DGSrwiVwSx75TskfBUbpxFOkmErkJsBhgEfQo+PKAycd6/jBpiQxnjr
 k714h3iUZxseyYaJHOzrj7B703oeRpGat37oEG3GZLxNrfBSBjAaIrD/jzdEcu6e3bXr
 +DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792624471; x=1793229271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=umQBs0jc4pQgaMYkFT6HH+2iJmSyQyXzAG5XzBVFQBA=;
 b=bwrptNx7RTll81lutVplzVVcLq0BS1sN9XfnpdhRt6l19c29/g3uFlk1JjXClusf/+
 t5tsiaw5W81xB+T3Tn55BQPvtYJESHoNqxsn2rDpdZHNmPOY4+R/rv04w4iwT6NLTo38
 F+8re75VHu548x/id++1rBRqmx396vmfcs7Tq84eus6IQoxcpKzJImZU/h+pL13ucZDD
 MGu4pTj3Irv95rpohV2dkP3iOaLGQlU2k0XMwLlI5sXu9Ycy5O7cPIM2wzWQE+5wKA6U
 5uRw4m13Zn7SRHsDhiyZLc93WQQ1KeipOlCUELVKlqd43Cf4Ta8/qDzrgK5A63Zb+/gB
 y9Xw==
X-Gm-Message-State: AFq9FYKVBbEkrdtQ0a7/B+kgmDxTJJpZqIqcXFc2BRXhOcnwT++l5WZi
 hr4NcBXSBCG7wJONfkwYceir1exfI9977byWe27ov8SxPxQlUmZRIge2DiOuilV+OpoOjEJkHJO
 22bjGjY++AURdizBb1RQfOijfsVua20gzib6jt0skJNa/YYtJy0FKE1/XHg==
X-Gm-Gg: AYBFou0Lj1h3M2HX58d11+52cFw9B6fHsmX6OTqpgL5rzWK7Kzb2DYmKQD7Ff7s0BdK
 ynquNtlVyHONEYJyQHQvwiTvNkimp8oL7tXXQv4hv2kqT5oJe6vBGpKViMLY4N312lLzVQ0o7Y2
 VLV7xPnaA0MzRO4hbFukgSGQVXJztP0XKpnDKevdeo2aUUUyBMzcKKph93Ma8/65z7/xFtkA6yp
 66xF5a91XhnvQInrz7waPIfKyM+4oRAPjs0FTnb9QaOhOq3/iclP1klH/vICYA7yw4HOg2OLHbI
 LKRETpTQk/KOuLoUyf36wvPkD5kEDCP6J3IkS8MEDCtNNY3/WfCzLY4xE3i+yjg5VMjFzA+RYUp
 yQXvG52Wd2Uq09veoNQsyTEUxfrrXOLoBgs+sN9iZOqjiRjhftFG7mMgQmNa5IVvnQpMoDoXWVQ
 ==
X-Received: by 2002:ac8:5d0e:0:b0:535:a5f7:d591 with SMTP id
 d75a77b69052e-5369bb71a77mr64564411cf.75.1792624470692; 
 Wed, 21 Oct 2026 16:14:30 -0700 (PDT)
X-Received: by 2002:ac8:5d0e:0:b0:535:a5f7:d591 with SMTP id
 d75a77b69052e-5369bb71a77mr64563941cf.75.1792624470140; 
 Wed, 21 Oct 2026 16:14:30 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com
 (200-204-190-237.dsl.telesp.net.br. [200.204.190.237])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6cd0dcsm11995651cf.6.2026.10.21.16.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 16:14:29 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 antikostya2@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 11/18] hw/riscv, target/riscv: send trace trap messages
Date: Wed, 21 Oct 2026 20:13:38 -0300
Message-ID: <20261021231346.2452179-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bfkRFzTzg9pagFWQuSdVSNl-Xv2jzZM9
X-Proofpoint-ORIG-GUID: bfkRFzTzg9pagFWQuSdVSNl-Xv2jzZM9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX6nmN4uPp2S69
 5BYoS3Cqjvla/UvfMT/Lqe3sbAqJ68ODVyQYAfIDt/GFMBqfDd4dE9jRk0Q9yHJTznWitTaz8u3
 ZpYYWdBgC/udauQSEPxu3pULEgATajo=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad94757 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1gIMccR7lhx1aHGv9TMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX+bllnwtKMftX
 YpFcthLzQ20guq40bm5zIivNXWUxJxdgTXOwNTgfbkXub2pSfhK6lXCyhnOkUsKRU2FX4AoLEis
 x5xKdIGo8ZODbm8bS8DrGcCKkZMSowFcCHBk7qurQ6dlHgrKA+4fJkZF3/pQqOxPs0M+JqvDnft
 xMAzVblzKCEXxHHbasYaq42KwchvYS659hBuqt5G98x3Zv9kwg/vRe2UFqg+pEoAKbRvO8YZXjE
 Wx/EhvVlrICh8t97HXiDbjCLhm7AYMCEtgvOeZtnLdyf8C+rf2MQRCihp56kvlFQeeQKtVaI0mn
 gwTLB5ShGHQyurGqAj1vZoB5Uuj/KrZLPPvZUq9+hc7/nXIxtXMTjpccLqsxyzgDPiwoAMVroDl
 7412oCQ2NaWs9LiRdNR8DvGwGD5NRt3wGTTZ/jUK55I82AIitYxSH1N4IORSdCsxIz4ctYouQHY
 kUrnu3afeDBM5yOxrQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210092
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the rv_etrace_gen_encoded_trap_msg() helper we added in the previous
patch to encode trap packets to be written in the RAM sink SMEM.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/trace-encoder.c      | 17 +++++++++++++++++
 hw/riscv/trace-encoder.h      |  4 ++++
 target/riscv/tcg/cpu_helper.c | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
index 2b358b2699..0e912952eb 100644
--- a/hw/riscv/trace-encoder.c
+++ b/hw/riscv/trace-encoder.c
@@ -404,6 +404,23 @@ void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc)
     trencoder_send_message_smem(trencoder, msg, msg_size);
 }
 
+void trencoder_trace_trap_insn(Object *trencoder_obj,
+                               uint64_t pc, uint32_t ecause,
+                               bool is_interrupt,
+                               uint64_t tval)
+{
+    TraceEncoder *trencoder = TRACE_ENCODER(trencoder_obj);
+    TracePrivLevel priv = trencoder_get_curr_priv_level(trencoder);
+    g_autofree uint8_t *msg = g_malloc0(TRACE_MSG_MAX_SIZE);
+    uint8_t msg_size;
+
+    msg_size = rv_etrace_gen_encoded_trap_msg(msg, pc, priv,
+                                              ecause, is_interrupt,
+                                              tval);
+
+    trencoder_send_message_smem(trencoder, msg, msg_size);
+}
+
 static const Property trencoder_props[] = {
     /*
      * We need a link to the associated CPU to
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
index 1801193e15..75645218ba 100644
--- a/hw/riscv/trace-encoder.h
+++ b/hw/riscv/trace-encoder.h
@@ -46,5 +46,9 @@ struct TraceEncoder {
 OBJECT_DECLARE_SIMPLE_TYPE(TraceEncoder, TRACE_ENCODER)
 
 void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc);
+void trencoder_trace_trap_insn(Object *trencoder_obj,
+                               uint64_t pc, uint32_t ecause,
+                               bool is_interrupt,
+                               uint64_t tval);
 
 #endif
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..8bacf0ca59 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -40,6 +40,10 @@
 #include "pmp.h"
 #include "qemu/plugin.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/riscv/trace-encoder.h"
+#endif
+
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
@@ -2300,6 +2304,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc,
                   tval, riscv_cpu_get_trap_name(cause, async));
 
+    if (cpu->trencoder) {
+        TraceEncoder *te = TRACE_ENCODER(cpu->trencoder);
+
+        if (te->trace_running) {
+            trencoder_trace_trap_insn(cpu->trencoder, env->pc,
+                                      cause, async, tval);
+        }
+    }
+
     mode = env->priv <= PRV_S && cause < 64 &&
         (((deleg >> cause) & 1) || s_injected || vs_injected) ? PRV_S : PRV_M;
 
-- 
2.43.0


