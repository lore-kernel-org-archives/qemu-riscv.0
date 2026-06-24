Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20835CDB47C
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:09:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9y-0008Du-4K; Tue, 23 Jun 2026 20:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9m-0007xU-6v
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9k-0003L8-7C
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:53 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0VQ8999837
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UJ/VuRTDDvOZzIN9WXSG0TT4FVv4DNHGoPKG+8PDOo4=; b=H8YAMXPWQ+JUwj+u
 x01PWQZ+b21hQXdPKvX8bH7Yaw3M6u4ahIFJEHUHM8bVcjtLPtm7FsN92AmfSM0l
 PDaUOLlVJajlETveEVETVe6SNh4+Uk4GFx+KvnaH+yWtARUOuZpmBGRbYBtc6DhN
 +kmduaRhJ9NnMCw9G+8yimWp4k/iE0vebTbOr13ky0gMlPm4EogEDCmMDpwrrLSC
 A9rHB/JlWkQaDv0Ge54WdN16+Tt9Xpn9IqIpg3PdiRWwexrjt40345YXQT9yqNOi
 KxfOCRo1mJ2A6LQYzPOTMpzVNpnwjAFV3GKWdrpaZWtOO4NgdaNE7V357ipV70gj
 J+1U0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yu4ev-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-519fd6364c9so6411451cf.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259660; x=1782864460; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJ/VuRTDDvOZzIN9WXSG0TT4FVv4DNHGoPKG+8PDOo4=;
 b=TAH1CNJqay3TStZ60ce86Pxp3tzHitmV4C6qUJtrKOk54OELx/I/0T2uOwONB6YHeH
 i9jE3Qs1ZZpPp6eCHAqsTTjSqK/3TP2C8PegA5V/IA53Xov5FnZ780+9+/9VMt2SejfP
 5a72/DcAMDO9f60sgWt9Z6yLxRWuBBG+hyMc2/NK9mCQb6tPRRMrt3RQRPLUg/IaoAG3
 afjQWuhMI68Zs5cO+qWp2UcxrQc2EDFtvBZNZp1CskwBvGYY3eh09aIvmaBxSq7zLbKC
 /WHgr6w7zgvim3+Qz9gDTJJPhc03ZccDmw+96FGw6Lrnsji07u2Txm650hBWTbZfwApV
 dMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259660; x=1782864460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UJ/VuRTDDvOZzIN9WXSG0TT4FVv4DNHGoPKG+8PDOo4=;
 b=X9XujNmaMMuP50hK3pzcCc5f6Oj3SCSjgWni+CCVvqyvR434xAX0x5EpuuOdo6fx9w
 GQBPaN1LHYDU3RFsBLsvf4vbBsOnvLGqTsLGJ8q6hMR62EmKyoSmKIDC9aFVZBRVzSAQ
 Pk1yxVqPa4i7Qbs2Y8OD+4TrPS9yD9LC4GlUYNSf6cGh3VdK4u87R2NmSbUo6w2OF8Xa
 N67vLTJOQj1/O/orBfupIWcqIXYyjb68E3hxmMoCk+Y+HFGH51n/19/qYAzS4mA83FWc
 wfslOM5e0J154fGDUJEf+529WZwtAM+6jcLKZpBpuvSFo9hCVZg7fZfiJqMg2PKvcj7e
 H78w==
X-Gm-Message-State: AOJu0YyImYQb0oB//vuqhBPEMbPmMCEZsU6NJq9ZkpXfG+1uT6pDtrcU
 N+FQUNmB3lreYnAn84sq3mhBaKW8FLAl6m6XcqtLghV3T0dMXBrFritVPic9X3kzGQ+ozE19e2i
 sEew+CfNXcQlJoz8R6ncrD8iLBIVcRnkGmrSEig7Zu7b5rpsimhou6lTHug==
X-Gm-Gg: AfdE7cnAFZFflHy3zdJ0BVINZRc0IuLPG7yoJPXvoSMP0hfr3s/EVBRgXz4R9COo0Dl
 B+X8sMRMaF7ZZfyrDttjkTHxPXq7uZJyT75qmGMvT8/xmxnMbH50eVKGh3m2gVUfHMiDzMbUoYg
 r05SZFS1QqEyvrH1ZtB0npRLyQUwcOGMbwl4BYZMOKF+uLPQzxdq/0CPInOoQEs6wrSJSPjLKVa
 T/7vmd0s7MZFj4gzkUhUtGLsQ9akeofPc/6/OHEz3EF40R8PHHzE1nhfUzxtHA+5DmPjMwzg/zc
 yMiTadxh/mQNuU/C+xuLUl+3TA3XlCdkYjVscBVl0OhhKeHqtFA/+ns2z46q4HGPVKj/EbIdNPq
 EHmxxZHZ29DUIg1RSel6n/BjHNCb7EXtyIlJ6L/CNTmReeA==
X-Received: by 2002:a05:622a:1aa2:b0:516:ea30:8756 with SMTP id
 d75a77b69052e-51a61bb526cmr21745091cf.36.1782259660585; 
 Tue, 23 Jun 2026 17:07:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa2:b0:516:ea30:8756 with SMTP id
 d75a77b69052e-51a61bb526cmr21744401cf.36.1782259659958; 
 Tue, 23 Jun 2026 17:07:39 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:39 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 20/24] target/riscv: move riscv_cpu_set_rdtime_fn to
 riscv_aclint
Date: Tue, 23 Jun 2026 21:06:27 -0300
Message-ID: <20260624000632.2149359-21-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3b1fcd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=u0cZ2EjT8PS4VQJ4ig0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: YgWpi5wZmeQs29onCIKq2ApcMmxuzXKT
X-Proofpoint-ORIG-GUID: YgWpi5wZmeQs29onCIKq2ApcMmxuzXKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX9qui309lE5Fy
 qhpfUHY8KoO1TBgjkkuLyDUjItU6UNmOChTl91wddXyp8ypXkkWtkuAycvZpmvdAmb2LNSOe2KW
 Of1Lh4cXtV7ASKvRCk8fbqosItGJTANC71DRlh5g85HjHnfrhnBLqb4Ehpbc5v2LApArWIdZreg
 3Xr4PJoIcGmU9YrxdD2G1YrqZ6m2BhBCI0X7x5KnPsxHOlYWVZ1E2302Tjs1Ev6k3LX8nehRU9d
 +cGWNB4o29qhjzRjIYvLzzVr87y3rn0a0fOaTl5GfgaEuybG61Nyj+Z1PxpzuiBiV6Lf+63wQkc
 KTgLUPokFUv02Xl1pdjkNiBOKeJlcV17Hs4ZpoX0pzkfJbnJsfuxpT/lT6drouFxzPTHb4rjror
 8wiFS3V1pdJYSyi6cY0vtNRuTZpz38OFOCATtFwUp05cZg9jLg3pbE62zKrFBFAWNKITMG2txz1
 0XdSNY6WP1DzcOFjbdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX/b0WU64aHxlR
 6eGzEXtp95hYV1bJwqHc1WlrmCA/JLKIaiSKR5iEy+8eKbGRA7G2vB4lQf8RM4tgobOGP03DIna
 rBv52gUvsrPIkWoL2SResruDRKswUHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

There's no need for it to be in cpu_helper since riscv_aclint is the
only caller.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/riscv_aclint.c        | 8 ++++++++
 target/riscv/cpu.h            | 2 --
 target/riscv/tcg/cpu_helper.c | 7 -------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e27e5fb394..361a8d1bcb 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -40,6 +40,14 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
+static void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
+                                    uint64_t (*fn)(void *),
+                                    void *arg)
+{
+    env->rdtime_fn = fn;
+    env->rdtime_fn_arg = arg;
+}
+
 static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 396d9253e6..d6c5d6c1db 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -682,8 +682,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
 void riscv_cpu_interrupt(CPURISCVState *env);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg);
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 9237d2129b..822c9fe483 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -612,13 +612,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
-                             void *arg)
-{
-    env->rdtime_fn = fn;
-    env->rdtime_fn_arg = arg;
-}
-
 void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t priv,
                                    aia_ireg_rmw_fn rmw_fn,
                                    void *rmw_fn_arg)
-- 
2.43.0


