Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5572606A319
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DU1oacy4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7B4wvn3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJQiV-0007DZ-3H; Wed, 21 Oct 2026 03:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJQiL-0007Ch-Ut
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 03:26:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJQiI-00014R-Qj
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 03:26:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L7EA61365904
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 07:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2zoaF2iR+Wz6pFtnanrhWuer4x1dALmitloSery1EN0=; b=DU1oacy44htJh1ge
 PxnuUsu2JXVP7C9Nra58wJlgE5D0llUoR5gu4hTWAvBOFrQ0g3jZGAOXo8RJ/836
 zPORlmZCvN+c1iYUhivOc4W+oaNy8fDhdcJYKsUuM/EKAwfpSwJYGXmb8UP6bskE
 Dgg6qRkVtCnKeyZHtqs2Q+pQ+PMYeaxuclny7sKFACvIIyEaZ/tMFtokyNZP9Me0
 E/HqXjwLcs8qFoxi7BbAd9tr55FfmXgal1EVpF9waPHCNYg06pcbHHuumS7JYFb+
 YUiu6Cj3JeASR5w7X0ehVyqumHWo2wkHgDQPczR50aLYx6UtJtYzr9XBlScm6Mc1
 MxNQ+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs01r63-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 07:26:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91bc57d4d11so11977506d6.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 00:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792567575; x=1793172375; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2zoaF2iR+Wz6pFtnanrhWuer4x1dALmitloSery1EN0=;
 b=J7B4wvn3zxDO3205gwJCDAf5a14gEQrBz0r5bPZQR1j5y0ZmjcBUamnfwdaJn7NHzD
 V2QgKPHiYTysCsWTHUSh8nKdBvtWVm5eI+DwOeVsJP7oB8sn5a6TFAeXBf+cYeTIJc5F
 2+5ozuxOc9LALbo2An0N1gZTCe/cRyLp5BEjczVbSyspAeMPMiIonAx6VzaXVvWPpzES
 n2AW2PoEtkSmmVpb878SOZ8Mo0QUq1yQVnUkA3ahcr9+EnqqkchgCpc8hJJD4bj6SmWH
 IPI62cuGfZzhNwh72Zrz4iIvoN9v9hSAdJZoc7SXCP/PKBEvVukrwza/IGgMpKuGwF4m
 DFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792567575; x=1793172375;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2zoaF2iR+Wz6pFtnanrhWuer4x1dALmitloSery1EN0=;
 b=nlEBQKhrKZiLLI039QDthzFC4JPXkg7ofNrZ0228cWZ4BkbGofaddc3dMQYZ2/v96M
 Wtpe501d2A4KX8WtTpUD+5yMViFn4/K/Joy762IVdNZbTQC8OVY3FqWbXsVH4o+m/mws
 K0aUifcKhUwWhL0aT3ShLPO+aA0KiazarZz92TB1rijigdjwJTpXZ12dgxQuCCUf7lxB
 JJNlBv0j9WA9Od4b4NpJo6Nm2NaNj8zv8qkb6S4LOXCxxkCZz1U3lHQHDh2Rn5M19agX
 3HtMxRyU9IrFh4sba8c4nh2B8k6LYRGUUNed08C8IWUfD4GqWMFigcZ31A5uqEA3hLJh
 B/BA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxOlR52Yn9zTrMouDjKbMstJzFo5rUAdLegH47muTSk6kI4iR/HudlC/dmefR/Nmp3ZhJczDwQ4xArI@nongnu.org
X-Gm-Message-State: AFq9FYJTNyiQk2JX2MZbGxtLvCtSfGFfj0ppXNJE2r097zc+JLOi0Ng5
 JB/re6LflS7rshzE7NqPNVjMAvoJhTj7K0iJVVRFAx4TaPeBhFbTWYQPjG0/ITsTiLTI855OUhA
 nsASur5YyOWfuI+h/pXBfqdPYi9cwf2UVRm48cOtn+KcycTTwMRmtTcREnA==
X-Gm-Gg: AYBFou20/xa5QU5HSshlwzxIQMFo9rut1yGWZBT6MKeRUFaJsFvxCgcGcwaet3rUpI7
 pQ6+oexskqFS2gH6AwFIqey5JnaHeGIpoWIUbYhfj9tgd8Bjbn3CRHOgVXvqvCdwTRZfCJOhDUI
 /0J+eKwDBKyoRbB8CqfIah2Z2nrNKndy6riphfSc9b0I2ebDAXnlcoRK0jIsxmVjqAYJZa3Re/l
 BdB2XdXcMiMXwOVfA9HvvSL1PbBIsncoS8SA1C9z8V+tBq4QiM8E9/OL5jBSiZ+dC97Yvo43HKr
 lpuCoHXs9UBqi79KVjzHFcGA3qZT10k2aCvw3fLueNX7JWBN33EOO1eZzrfx04sp+O2eL3QbcIf
 wQCuQZGc7a14PAhvv2ovxvOhLt8JPOMkfmg==
X-Received: by 2002:a05:620a:a88d:20b0:93f:38c7:70f9 with SMTP id
 af79cd13be357-93f57f0bd94mr189722185a.14.1792567575503; 
 Wed, 21 Oct 2026 00:26:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a88d:20b0:93f:38c7:70f9 with SMTP id
 af79cd13be357-93f57f0bd94mr189720085a.14.1792567575050; 
 Wed, 21 Oct 2026 00:26:15 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd2eff9sm32910885e9.4.2026.10.21.00.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 00:26:14 -0700 (PDT)
Message-ID: <145a7086-d9eb-4cf0-a162-b3a44d51e9e6@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:26:13 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] target/sparc: Add the AES key expansion
 instructions
Content-Language: en-US
To: Stian Halseth <stian@itx.no>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Biggers <ebiggers@kernel.org>, qemu-riscv <qemu-riscv@nongnu.org>
References: <20261021064640.3591682-1-stian@itx.no>
 <20261021064640.3591682-5-stian@itx.no>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261021064640.3591682-5-stian@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad86918 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Tw0MqJahTJh3gxrfwiMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfXw6gZwE9lTnHl
 +8BQNx5cnAJ1tnzEplYMS9pqeQXf+9a6/fmaeZ4pcdPOpbqmxVkz7kkOiuj18OMhGLU/uCElwzj
 opQ4BbODu0WhwZqBFJcgTyrAJVVeAeTCI+CJLHH5pQRCDxlv52TGtkyKnpurYb17FXPYjgL3B8S
 jHC4vp9Wie1uFSWtMEpZHHOXFfmB4RULqU+jrnbkDVL1O241zZcF5GsskyFogR/1CfbSLS9/Pb+
 H2J0THx0pOvZBKZtTTM8FOPCs+niyFKajVHYHcV//AuczyV+BRhcCYy7rt5GP88HioIUCPD5wpC
 5JABPptiUkCDvWiPprQW3F6fkj/52ANfGVBAf47pHbA/5/e8ChJJER+CAHq2Dj2cs+cHlC0J5Ke
 MVRDPPGJqrxAiK9qqUSoRaInglY+qda1kQlif4ATTHTRf/avTSXLmo9MFACw+X2tFORk5jVMnRI
 DOrP4xz8dBRFLLGGxjA==
X-Proofpoint-ORIG-GUID: Fl9o3wSVx9zfWLTAYr9mQCkTT_1jEPkp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfXyll+k59Kkmdh
 4+/PQMyDs/d2MJrPfiPj+Isr0ruKc5tVkrZyLdfVrPvysX31yCbi8+kpGWHZxYoWoTCJANO3dQs
 kCSM0ZK5mmDKZ97vNMS4ExpgdUBIDyI=
X-Proofpoint-GUID: Fl9o3wSVx9zfWLTAYr9mQCkTT_1jEPkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210029
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/26 08:46, Stian Halseth wrote:
> Implement the AES key expansion instructions according to
> OSA (Oracle SPARC Architecture) 2011 sections 7.3 and 7.4
> and set the AES bit in the CFR.
> 
> 4-operand form (7.3):
> - AES_KEXPAND1
> 
> 3-operand form (7.4):
> - AES_KEXPAND0
> - AES_KEXPAND2
> 
> Like the AES round instructions, they are gated behind the
> crypto CPU feature and disabled for sparc32.

~ "The AES feature is now complete and exposed in the Compatibility 
Feature Register".
> 
> Signed-off-by: Stian Halseth <stian@itx.no>
> ---
>   target/sparc/crypto_helper.c | 58 ++++++++++++++++++++++++++++++++++++
>   target/sparc/helper.h        |  3 ++
>   target/sparc/insns.decode    |  7 +++++
>   target/sparc/translate.c     | 30 ++++++++++++++++++-
>   4 files changed, 97 insertions(+), 1 deletion(-)


>   /*
>    * SPARC four-operand AES round (Section 7.3).
> @@ -87,3 +88,60 @@ uint64_t helper_aes_dround23_l(uint64_t key, uint64_t s2, uint64_t s3)
>   {
>       return aes_round(key, s2, s3, 1, true, true);
>   }
> +
> +/* Combine the transformed word with the two words in rs1. */
> +static uint64_t aes_kexpand(uint64_t rs1, uint32_t t)
> +{
> +    uint32_t hi = (rs1 >> 32) ^ t;
> +    uint32_t lo = (uint32_t)rs1 ^ hi;
> +
> +    return ((uint64_t)hi << 32) | lo;

Alternatively:

        return deposit64(lo, 32, 32, hi);

> +}
> +
> +/* Apply the AES S-box to each byte, preserving byte positions. */
> +static uint32_t aes_subword(uint32_t x)
> +{
> +    return ((uint32_t)AES_sbox[x >> 24] << 24) |
> +           ((uint32_t)AES_sbox[(x >> 16) & 0xff] << 16) |
> +           ((uint32_t)AES_sbox[(x >> 8) & 0xff] << 8) |
> +           (uint32_t)AES_sbox[x & 0xff];
> +}

We could move that method to include/crypto/aes.h and re-use
it in RISCV's vaeskf1_vi / vaeskf2_vi helpers.

> +
> +/*
> + * AES Cryptographic Operations 4-operand (Section 7.3)
> + * AES key expansion with RotWord, SubWord, and RCON.
> + */
> +uint64_t helper_aes_kexpand1(uint64_t rs1, uint64_t rs2, uint32_t imm)
> +{
> +    static const uint8_t rcon[10] = {
> +        0x01, 0x02, 0x04, 0x08, 0x10,
> +        0x20, 0x40, 0x80, 0x1b, 0x36,

This table is also used by RISCV aes64ks1i, vaeskf1_vi, and vaeskf2_vi,
so we could add a common const uint8_t AES_rcon[10] in include/crypto/aes.h:

-- >8 --
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -29,6 +29,7 @@ void AES_decrypt(const unsigned char *in, unsigned 
char *out,

  extern const uint8_t AES_sbox[256];
  extern const uint8_t AES_isbox[256];
+extern const uint8_t AES_rcon[10];

---

and in crypto/aes.c:

@@ -944,6 +944,11 @@
  };

+const uint8_t AES_rcon[10] = {
+    0x01, 0x02, 0x04, 0x08, 0x10,
+    0x20, 0x40, 0x80, 0x1b, 0x36,
+};
+
> +    };
> +    uint32_t t = rol32((uint32_t)rs2, 8);
> +
> +    t = aes_subword(t);
> +
> +    if (imm < ARRAY_SIZE(rcon)) {
> +        t ^= (uint32_t)rcon[imm] << 24;
> +    }
> +
> +    return aes_kexpand(rs1, t);
> +}
> +
> +/*
> + * AES Cryptographic Operations 3-operand (Section 7.4)
> + * AES key expansion with SubWord, without RotWord or RCON.
> + */
> +uint64_t helper_aes_kexpand0(uint64_t rs1, uint64_t rs2)
> +{
> +    return aes_kexpand(rs1, aes_subword(rs2));
> +}
> +
> +/*
> + * AES Cryptographic Operations 3-operand (Section 7.4)
> + * AES key expansion without SubWord, RotWord, or RCON.
> + */
> +uint64_t helper_aes_kexpand2(uint64_t rs1, uint64_t rs2)
> +{
> +    return aes_kexpand(rs1, (uint32_t)rs2);
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


