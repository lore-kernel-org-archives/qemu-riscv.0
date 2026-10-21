Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC6606A338
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TlFUP3ca;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZmNx/jHJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJW57-0004y0-5D; Wed, 21 Oct 2026 09:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJW50-0004xY-W1
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 09:10:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJW4y-0003hk-ON
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 09:10:06 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LBg7uG3658126
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 13:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 we5qFbCv5BxKgZ9S9m4CRft1J3M10rPpWJMXwyiMeZU=; b=TlFUP3caxLd02gIi
 jN1CUpEQhY6YDlxWvloUgg3SX4RJaWGlbIkWAAbjL4Q60Npbii8NLtvjdDa6iHK9
 It3F/q9+rYWOF5xBhUvGNIScdJE9f5fF1LgqfPLWcgnUrXutuFOM2UXiNpWGVGIb
 5zJ0QrjdYeiuhUViyH7GoEqQIzmMuFxBaWLan7FwmrjKpCWK+zvKIV/RF4DrTlfg
 pzSMKHa6ytiPwSeZ4ukOR0j1DuQjGYEkoQ+kCFlp1NQ9E9yLz0KDU8BoA5Ebki9A
 93kqKp8xDKaaIFKd1GbXSzWuup6x4M76IGZbNHJPJvUb6JhhuE+6GMcjjhgMRe6d
 8MOq4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9buaq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 13:10:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e82060977so161384285a.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792588202; x=1793193002; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=we5qFbCv5BxKgZ9S9m4CRft1J3M10rPpWJMXwyiMeZU=;
 b=ZmNx/jHJHDcXgZkZFUY7uS9hhWV0yjPPLRnreoeo1uanfsWNOklDZuFv2AkQoNiquW
 DPd9sJMkqCo3mw50iP8K9nVRXUmFP5yCfLqEzx3T0ZuJb063yEuAjLo+eDdVGNEDC3Et
 BJ9pK/mu/Rix+79GzKm7NLYeaCn+VFIhqm3W0nMFPIXKS5rZsuJonZ6+jwvUWdQur41j
 sbvMyzxnwdkWwIK6+Toum1hoOdiiFLkQ52b1FZVB0WcWg0BP3c7D1bvBytI098Dh1Xrf
 wFWr6TbJbTiBZQ+mns5dUoY4NAqU6RdTXzjBDCXZvxgc0vtzA3TDDwnCXFKTDbd9dPeb
 ExjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792588202; x=1793193002;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=we5qFbCv5BxKgZ9S9m4CRft1J3M10rPpWJMXwyiMeZU=;
 b=Hakja5gN0Mn3IQPFyLPhc5TfcsLCi36K9L4gZ7q1imvfbkr0hJUmSTp82KtGjSa2rA
 XX4ESNQdsVRemOD6XJD1Go5k6tRCyrF9hGoufjEtBRwBtyo9y09VFI9W2aUsZQXQcWtU
 4OgFKh85ZCOKeBJE2JnMSrimT5KllKQu/Y1BY2I4KOKLIVNsmZcb7qAix7l3TxYfp3me
 +TtBkmA6uJasi0aVW0NLB2hsYKceCIqzljA91sdFoG9vDQz4dmVMBwgM4mn4JDU+WqJK
 yahrK1YvGxg9CkModvdI4+fi8WfXbIIbqfl5+Q0jAgSanMGpQO9LSspUvhnVBGz2RYQg
 mE2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzO7ziDFHsOsJ1PZZ2Leua8Bga4+EOYQG2lLBlVDUdTSIi7Uit7vjpoMqYlkkFdZNLq4YtjcaAJLMSK@nongnu.org
X-Gm-Message-State: AFq9FYK3JHgvNy8Oa/GfU7GUfdbTU3a5HIeydvrAMueZyHJt2NajKr5f
 Vrq3MvuFp2uSLBhUYepdfZmt20sHV6tjjYar4DJfQoACKz7CKC0InL7pNbL1N83WUjT76b58aqD
 jHtYn3geAqGyq1Lct3DsO/cP2wMn+kheZVH4wp/yQzzyvwSlRvDWIivXZGg==
X-Gm-Gg: AYBFou1YA8mTRAao1ROVV5KUzQsc1eQ3seQbKViv+HXOSktAqth7X5n0eiN6pS30SKn
 It4P1aHo7OQb1mvITeGjoxi5Sa8lg+6FCIMKHaevjE9jQDFLW6CMLu1Pxhxr1muHyOMGNfgXcIU
 XED5yrLd38urAuweuOqbxXmgsPgy/keWQKXV/lD5ex2r76xakpIONhOVsAZNaLKhK8bpHacFr/I
 4sSQ+n6PVqxIaUbMhKQJIGhBJSu/bW1ticDxjinA1dEY6u1c4dTkteU9ZJkNw3VWs2oiwNNjCzw
 HddQ80nWUm4QdGMrJ7NxQ1kDSXKm+Eo6PAs+ebwoAhdRBiIlpyojQqy19vTe5w+ybi3drdQRfMS
 JhRd6yKbIPObeDE3+KptqSyEcxdQ5VAI5Yw==
X-Received: by 2002:a05:620a:28d4:b0:93f:2571:c317 with SMTP id
 af79cd13be357-93f4c78f7a2mr882424985a.28.1792588200932; 
 Wed, 21 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:93f:2571:c317 with SMTP id
 af79cd13be357-93f4c78f7a2mr882416785a.28.1792588200296; 
 Wed, 21 Oct 2026 06:10:00 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2583522esm5596478f8f.35.2026.10.21.06.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 06:09:59 -0700 (PDT)
Message-ID: <5c693f11-6ce5-4c95-805e-c022a7249f97@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:09:58 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Introspecting max32-riscv-cpu after rva23s64-riscv-cpu crashes
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <87ld7rmdi6.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87ld7rmdi6.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX2llY693hVRzV
 NMo74gb1L6LAzPkmkr1y4MUAnACeITg7bAI4/WX8kw+fWbOU3wpCExKTklMu5Qs4cJynG+gx7PC
 tWRnrsZo5VwuXuXBCguEEkUaSkVnPBY=
X-Proofpoint-GUID: wjMFVlcr6oeXUZcYltQrTfvGjoc4ps9w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX0T9G/4PGrBKb
 tAPG1s1g5D9E+l0BZfD6Hy1QUzMquMgzW2VsZc9s9QOTfo35WX5jxp2GmbLfJ3XCi30b7p586Sz
 fvSFYny+KRv29PydUdxDvXp9KHsQPEWZaYIF3BVik3Xf+avHnFE2BUiWlUOtXzx//+h9cNGq6Ow
 bWwUSzt8B1UUdiI9q9txgBJqbcYy1qJgecS9WpgrGsLNhiE+PRAvzjtY/wdVX7r+FqKt+OXk5iY
 yBOV8vay76YGWY14yz2K6eJdS73WfbUYOQqlu/A9o/ls2EHimnMJUgrUcCJuB2erLM7G34EVtQK
 XtKXkclbpnV2BPLZ35JV+YyyZdv6g6pXjoh4skrjOMX5sfwwuBVJmich5QwNQpJTx60nWTgZ8T+
 wY1YSvpvTPzr7LJ/tQOWye57vq/muvPTA3qaku4lfYybI5bWYOdjch+7p+TL8GdX1QfXi5gxbLe
 ZGE49nWkREVQwkrdT+A==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad8b9aa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JU8QZXDhB6R5nT4ilmQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wjMFVlcr6oeXUZcYltQrTfvGjoc4ps9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210052
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/26 14:42, Markus Armbruster wrote:
> Watch this:
> 
>      $ qemu-system-riscv64 -S -nodefaults -display none -M none -qmp stdio
>      {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 11}, "package": "v11.1.0-2545-g2d150b99ce-dirty"}, "capabilities": ["oob"]}}
>      {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>      {"return": {}}
>      {"execute": "qom-list-properties", "arguments": {"typename": "rva23s64-riscv-cpu"}}
>      [Expected output...]
>      {"execute": "qom-list-properties", "arguments": {"typename": "max32-riscv-cpu"}}
>      **
>      ERROR:../target/riscv/cpu.c:516:satp_mode_str: code should not be reached
>      Bail out! ERROR:../target/riscv/cpu.c:516:satp_mode_str: code should not be reached
>      Aborted                    (core dumped) ../qemu/bld/qemu-system-riscv64 -S -nodefaults -display none -M none -qmp stdio
> 
> This is satp_mode_str(VM_1_10_SV39, false).  Interesting part of stack
> backtrace:
> 
>      #4  0x00007f9d6e7cd447 in g_assertion_message_expr ()
>          at /lib64/libglib-2.0.so.0
>      #5  0x000055801fc2f556 in satp_mode_str
>          (satp_mode=<optimized out>, is_32_bit=<optimized out>)
>          at ../target/riscv/cpu.c:516
>      #6  0x000055801fca193c in riscv_cpu_set_profile
>          (cpu=0x55802e5b8c90, profile=profile@entry=0x5580209732e0 <RVA22S64>, enabled=enabled@entry=true) at ../target/riscv/tcg/tcg-cpu.c:1305
>      #7  0x000055801fca1cf7 in riscv_cpu_add_profiles (cpu_obj=<optimized out>)
>          at ../target/riscv/tcg/tcg-cpu.c:1549
>      #8  riscv_cpu_add_user_properties (obj=0x55802e5b8c90)
>          at ../target/riscv/tcg/tcg-cpu.c:1622
>      #9  riscv_tcg_cpu_instance_init (cs=<optimized out>)
>          at ../target/riscv/tcg/tcg-cpu.c:1741
>      #10 0x000055801fd178a7 in object_init_with_type
>          (obj=0x55802e5b8c90, ti=<optimized out>) at ../qom/object.c:430
>      #11 object_init_with_type (obj=0x55802e5b8c90, ti=<optimized out>)
>          at ../qom/object.c:426
>      #12 object_init_with_type (obj=0x55802e5b8c90, ti=0x55802e2e0250)
>          at ../qom/object.c:426
>      #13 object_initialize_with_type
>          (obj=0x55802e5b8c90, size=<optimized out>, type=0x55802e2e0250)
>          at ../qom/object.c:512
>      #14 0x000055801fd17c5f in object_new_with_type (type=0x55802e2e0250)
>          at ../qom/object.c:710
>      #15 0x000055801fe17276 in qmp_qom_list_properties
>          (typename=0x55802e5ab3d0 "max32-riscv-cpu", errp=0x22c5a0,
>          errp@entry=0x7ffe4a494aa0) at ../qom/qom-qmp-cmds.c:283

Following commit 198265df8a7 ("target/riscv: convert profile CPU
models to RISCVCPUDef"):

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f3d70afb866..ed88adef452 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -540,6 +540,7 @@ struct ArchCPU {

  typedef struct RISCVCPUDef {
      RISCVMXL misa_mxl_max;  /* max mxl for this cpu */
+    RISCVCPUProfile *profile;
      uint32_t misa_ext;
      int priv_spec;
      int32_t vext_spec;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7dcaf72fc14..54fce767657 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1487,6 +1487,10 @@ static void riscv_cpu_init(Object *obj)
      cpu->env.vext_ver = VEXT_VERSION_1_00_0;
      cpu->cfg.max_satp_mode = -1;

+    if (mcc->def->profile) {
+        mcc->def->profile->enabled = true;
+    }

This comes from commit f655704c3df ("target/riscv/tcg: decouple
profile enablement from user prop") which ought to fix that issue...

Per-instance update of a shared class field? RISCVCPUProfile should
really be const there.

