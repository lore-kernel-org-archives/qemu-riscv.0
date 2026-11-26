Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA72606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yu4GwZj3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwkNdKpB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj1F-0004DJ-RQ; Thu, 26 Nov 2026 18:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1B-00047S-9i
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:45 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj18-0003oy-9D
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:45 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvnUF060366
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qA3AnsGHP2E5DWVmOckZhwq3GjX6E2F1HYmyhpPWWEI=; b=Yu4GwZj3xCKBTMH2
 0/m6Un+RRN1uep2xQWIlBHGcHC1r+sX/tm1jQW1oVWrbtpoBwJeXKXyqAwLnTq6V
 ad0IXYHQrUifdG+MFzeSiqRrR+js9PUpUh3+q6J82mbaVABAydctF1AiHTBCAfaI
 6Tb9hwrBZ2Pe7I+eHYuuzWlg3l+h4wFcH2jLHlGPmH011gkFIZEe+fNDqoeHp3Q6
 C2Q+YxLMFTYlF6UErRKhg4WbxMODG2tIUd0j2YnH8u5IHyH0FsF7nqJAuHMKTEYp
 NzZFtW2V8bLYsi5aPo+FijbOcuMGgXWj4nqEoRCWBPSZgKJCpvNXa0XlI+6t+Qs7
 qJzmQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hrfyg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-92111028a03so132668056d6.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736190; x=1796340990; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qA3AnsGHP2E5DWVmOckZhwq3GjX6E2F1HYmyhpPWWEI=;
 b=ZwkNdKpBU02fSu5VzDtqMXebwikVvR5RnpNgovWs3VZ8+mjn965m07PdPl4lp4Ms6U
 I1O0wFehCDfgvJd2jl0RAeJpvj8dXJ1mDgL7rrcD2iu9OT4CjNm/7QAdzY2mxrlKhcu5
 gef8XWPdcSwad8ON4Br8GiMyC7NoyqWxmaaQaFh5P/PX+rIgopt72ZUmAZ1rXEswzsFT
 3DDQt0nd/sebDQeG5mkLCRq5ueH+q9H9/v2qnW4cO1GG1yfrwNAna5mO5a+dW1BGi18w
 QZCoiwoBhu/sv/2ww+0NPoJ5HNhDC/9yf85hCdVPifqn2yZLfm/fWrphalaqgm+hxgzT
 9P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736190; x=1796340990;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qA3AnsGHP2E5DWVmOckZhwq3GjX6E2F1HYmyhpPWWEI=;
 b=BKchjkr/qcH7Szj87jkaA4ZyVrQ0JHGHX6VkMPMcaO+rb1DWlTOdxGB2qA9LXeY9Zm
 pqqktY+QP1fT8g907Od0J1O4k7ERBEcaejzsntq3VYflsDx4/rCLkjRcuPbjgAUCzeJN
 wcWLO2xzLcNixHFFHMI5ydP+5+Ev/K00mWekDXjT7AqkLiO8XXugmnpBFJUAX7MFHXWJ
 8ghkNavjy3IruiN1IdfCuZiH/zqB+uPPJiWIBKi+bVPa02gUElDA2P44OTwXz75mHsF2
 l0VcQ952UWuQ67laomsPFUryniOIdxD3/kTF4/ipI4mMm5jhtBhCB+uqJ3lIBaEWWndX
 cu+Q==
X-Forwarded-Encrypted: i=1;
 AL+hErE3GpiptgFQBuHgxMiwKEh8borYmQlegvHvLaisQ37pSAZWs9NTb2wot4XJO/DJBtUecuVl/BgvEJff@nongnu.org
X-Gm-Message-State: APuU4Z8kfbdGy9g7K4ZnrTNBM1oNF6nIXslZ2X+JtVVKJZcz879Ijca0
 Ccy/w3t8nYWOFjAprzCs761W91+yNaVuYe7Y8wrIA+udAIUqNBOcJJZQPr3SYPRvPfXGGI1TN9e
 gnQAJbPwOtqWdp496TfPnMqCRfqNOaveBCvijgsUUr0PdhkQL/uyRYJ5mGA==
X-Gm-Gg: AZFdTZe5GNvxNkqE+kV/J/mhjigU12lbrmEGziD1Cb2Lzuf/bWhhLvEUIzpC6oqAS4W
 DWLYIOcj6i637LbsdhVizpH1Js58VGQWQy4kLOnUeHOGCzmEpgSIFJ6iMpeEOss4mdPnLV0GODs
 6ppZt+qTzmxAJSHyxt4kZzZOhm5HCOfd3PqWZpWajtO8cXvw0MehntZMgDP5Sp6ADgLaxvmO0Cz
 WPUuZChbdGJ7Re8B3inQ72SRr8CrbwzQf8XbDWVtKsm0ijYReQ+eNcyZ/lgacdyy8pswJfJuyjy
 TCKqjtdWLp7rdPREsQCX0Zyzrd8mAGyTZycUsPtV9Jh3WSttZ0B1U1fctJ0Vp7C3dYHPATpg6D1
 ARG2jLlpX0Dg5IQ04+KxLzKCmSO+P5q19R3N4+ntv6JG9DWtNQI/1hl7XZmTkP8pBvtlc5/NqTy
 H4tPunkJ0zAlBFKg==
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id
 af79cd13be357-949ba7e227amr4008004085a.7.1795736189840; 
 Thu, 26 Nov 2026 15:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id
 af79cd13be357-949ba7e227amr4008000785a.7.1795736189341; 
 Thu, 26 Nov 2026 15:36:29 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884ab091sm897397005e9.11.2026.11.26.15.36.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/24] accel/tcg: Widen TranslationBlock::flags to 64 bits
Date: Fri, 27 Nov 2026 00:35:41 +0100
Message-ID: <20261126233604.67722-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXw2qOPv851Kbt
 ETaeDYRZZBi/MN2RAOP4QoWUOacTAzhQBLVXvx1SLuPK+vh1MZy5q5UjIj7rFuwMjb1pOTyQCCR
 CYo6KMJCF7iG1ho4zYlCaJ71iH54rxI=
X-Proofpoint-GUID: qv8NTYbZELXRvykaj8GjX6vYzZrTQrNm
X-Proofpoint-ORIG-GUID: qv8NTYbZELXRvykaj8GjX6vYzZrTQrNm
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b08c27e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YGiGA39mg4sSHCuJhl4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzUQnLdIgVpNV
 7SzMvvmagStEd50rX7dYEs3UE2sjcG90pvSkTFcWtw2BJtKlpBs9AvZK5j+x+C87Xpp14n5miyY
 xiZqsMR7Dt5Cts56HVhnhNen7+kFqukykQ8sbi3hoUVUfGn4qfrNK2PPemIdR//sv/UZMayQqv3
 Lz0qx01iFg4x41mktV5OmksRdkTF1VWm7blOauhJtwzft9osGgzD95A1eiwUCIyWzcRaxJK3KeC
 0moKGTmBFwY8MhYU5koxLHquGKWFjwsGzVvcHLxVzVw7gSCvwSAeEK4ZawGG3LU3MstMlh2YKEu
 2oNMPZoshLZbMD7Ej04j8QhqYWdRbQOBhm7Xo9PJeXoSReX811QDw4alYdbBKF74mVwrgktLSZ3
 hpo76me5SdLPLwNhdUsQ9spVyWWQ2uDFSIVp6j2ZOsgQRL3wTlrO8pAhO3yUtO+4qUsO5d/w2j0
 7TGIONsIW9y6aTqJFTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

32-bit host support was removed in v11.0.0 (with commit 372ec46b9f
"meson: Reject 32-bit hosts"), so there is no reason to keep the TB
flags 32-bit. The wider field fills the 4-byte hole between icount
and tc, leaving sizeof(TranslationBlock) unchanged. Widen
TCGTBCPUState::flags too.

Feed the upper 32 bits into the TB hash, and adapt format string.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/tcg/tb-hash.h              | 5 +++--
 include/accel/tcg/tb-cpu-state.h | 2 +-
 include/exec/translation-block.h | 2 +-
 accel/tcg/cpu-exec.c             | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index f7b159f04cb6..819b594618aa 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -63,9 +63,10 @@ static inline unsigned int tb_jmp_cache_hash_func(vaddr pc)
 
 static inline
 uint32_t tb_hash_func(tb_page_addr_t phys_pc, vaddr pc,
-                      uint32_t flags, uint64_t flags2, uint32_t cf_mask)
+                      uint64_t flags, uint64_t flags2, uint32_t cf_mask)
 {
-    return qemu_xxhash8(phys_pc, pc, flags2, flags, cf_mask);
+    /* Fold the upper flag bits into the cf_mask slot. */
+    return qemu_xxhash8(phys_pc, pc, flags2, flags, cf_mask ^ (flags >> 32));
 }
 
 #endif
diff --git a/include/accel/tcg/tb-cpu-state.h b/include/accel/tcg/tb-cpu-state.h
index 1903af4c2a29..07195df020a4 100644
--- a/include/accel/tcg/tb-cpu-state.h
+++ b/include/accel/tcg/tb-cpu-state.h
@@ -14,7 +14,7 @@
 
 typedef struct TCGTBCPUState {
     vaddr pc;
-    uint32_t flags;
+    uint64_t flags;
     uint32_t cflags;
     uint64_t cs_base;
 } TCGTBCPUState;
diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index f61e8e4ec0b9..f9f4876e6dd3 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -69,7 +69,7 @@ struct TranslationBlock {
      */
     uint64_t cs_base;
 
-    uint32_t flags; /* flags defining in which context the code was generated */
+    uint64_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
 
 /* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 449770148663..cba4e634f616 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -271,7 +271,7 @@ static void log_cpu_exec(vaddr pc, CPUState *cpu,
     if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
                       "Trace %d: %p [%08" PRIx64
-                      "/%016" VADDR_PRIx "/%08x/%08x] %s\n",
+                      "/%016" VADDR_PRIx "/%08" PRIx64 "/%08x] %s\n",
                       cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
                       tb->flags, tb->cflags, lookup_symbol(pc));
 
-- 
2.55.0


