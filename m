Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE35606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DBiBmPDW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E0gcGEfu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xK9qn-0000Cb-Sj; Fri, 23 Oct 2026 03:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xK9qi-0000C3-8y
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 03:38:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xK9qX-0001O0-Lr
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 03:37:58 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69N7FDdb1767179
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 07:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pwN0Hc9/C8B9Yoj9xDOwDWIc4uU6BlHm6lY7SQJwgds=; b=DBiBmPDWFEZXM29h
 83l6i3PiN+7LYe5boiM4onwAFteEwe646UpiZmioHbiy6L/XtuQDWGpF3jgbXwDt
 9Dkm3ueSutz2I5X2E74FdTT0+JNu0gBe8IcmvFFQFdheIF5EX0LnYZz+o4Mqqk+H
 IDPnBOZX8Qlqcy3qwZ5L+b/M0nWgfkOEnAHeRYwFvT7M5UKbNPDLbPhqRPCBq6n+
 bp0xH+SRABprhpvkQagJfz58NSzHqJWRVPdPRDm3fjs+prAGjZTtqMXJ8PepX7pz
 3OfhUeh/c7F7S7OW/iHWIyVGzInGCRcDqoKnFSWvu8UK0GFVvv6Z0qmVML1EiQdu
 SpIrIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtxv2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 07:37:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f26dd2165so205214385a.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792741067; x=1793345867; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pwN0Hc9/C8B9Yoj9xDOwDWIc4uU6BlHm6lY7SQJwgds=;
 b=E0gcGEfuWvVodVtJJUja/UghWhAVy26Gk+RL4B6cnMQCL7u6mc/NOIaM4G8wnsPZCq
 WKjNx7gZGEwDelJd+HPKmpYpDhtb1eeFxFoWwwUa2wIDJVhY52lfwT+GutW/qdy0UKGN
 vAAHsrwQOvZgLZstEPZrCuZa9m1qmcP+UGOG+f61gHiHqJGlZdW66pG/tSd1+0UTOpwt
 3PKRymIETA4QKbl6Fu76MAmwXSDW+kHCx4NUHA+Ees6yEWs+D289ePFdLD+l5ITb7U8J
 KgrloIXkuAW1GmHEImOLDrXW05qHJlLPEZS5d9S0DpB6oLeTbhPgJoRE8f91dng7gs7c
 6qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792741067; x=1793345867;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pwN0Hc9/C8B9Yoj9xDOwDWIc4uU6BlHm6lY7SQJwgds=;
 b=GaIhh0ZoSoo3UJgV9bn9Tog32uhBZZ/9s5XMxtOmMJTdkAv0H1Y4MOjGNTHscMEglI
 CHIxp5emuaq6lAWk+TatjGev8if5gYdmkh5ybv6ZCkLe3ABd+5axiBrPQJ7YdYyHkcx7
 +taKXSj7lVmaz+h5boWZsWkSoYtotICXH1jV4x/yLf58vy5zgDqTL5lvKCa52CcjKDGK
 niv690EKyN9lwMc/ZXGISUgd16P4dUt4Unm3V5T44FmyjsMEy0o0J+yPcEhnuWRHWbLL
 LUcymdNWQTvo351zEpe82HqBfscMJxtuot6lQWiMHlGK9vzUfveaL7TRKSwcrFijySjz
 qV2w==
X-Gm-Message-State: AFq9FYJBfy6P3j8f4Pb5mducKWgymrHYKVIM5lzX+4AsqT1eBZ7g1SDw
 6BZttyoZNkoaxmUroygLyCdkHDSybt9CsAJGIGpG7ndlnT4fNFJcLY0XdGYGA2YQCHYHWpU5/D4
 taX2nbd1qvXYB1G8BR/fypW28KJV1V2dsYjv/0ZMOnk86fUTwPHv9fkDW2Q==
X-Gm-Gg: AYBFou1hBg/4ScCxn4rrjVwMLYdNT2Tm/LNJpLJ6B1XllDItSlwuzBAdvby4U3x0G9B
 IAeOXWgbZ0vgpysPOwSBOAte1+zSwTXzHGzbLIJ1armb0Uuq09RFRSwk0BTlv9tYlhckFi0uY7H
 YIS7G9LtDDYT0+CgdgsT8D+lZ1EHl138ylP1nG1Fc4EcncY0Ol8DXxhDaibB5vkMgURJZI5DbJN
 xn/VjbKgmruxLU8TFROBwEawYV24m4OJ7xWFV0QaXtlhBcAO38Ye/g+hSQzSBR3y9n7xDI3fWJT
 LFfb2blUhMolI+o1S5+aC7RQcC7i0/ktWPMkG2ayGU454h74io19Qc8Q4FVi5+J5FiTgV67haRU
 TiHNk1XhDDbDucO5VZ1CaP+KxEuG59lOp+w==
X-Received: by 2002:a05:620a:7108:b0:93c:a468:2db1 with SMTP id
 af79cd13be357-93f6f9b7f76mr285723285a.58.1792741066585; 
 Fri, 23 Oct 2026 00:37:46 -0700 (PDT)
X-Received: by 2002:a05:620a:7108:b0:93c:a468:2db1 with SMTP id
 af79cd13be357-93f6f9b7f76mr285720685a.58.1792741066079; 
 Fri, 23 Oct 2026 00:37:46 -0700 (PDT)
Received: from [192.168.69.209] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a21034b3d0sm70782915e9.3.2026.10.23.00.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 00:37:45 -0700 (PDT)
Message-ID: <3d9baf66-d412-439a-b9db-099124af6625@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 09:37:44 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix CPU state access on big-endian hosts
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20261022130657.6449-1-anjo@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261022130657.6449-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX4DCz1y3lkmfa
 X0Y4FZU9+np6gO/KrAzic5YSV55kxZ/0RC5IqQw9s//aX0tg2C2pSVmviGyIG6tj9y9LS8/EzdT
 QAZxZtsGSURjPtApv2Sp1cszuqfxJIw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX4uEv8j5GYJKy
 ishiHHFxfJkChv0usP4NpJxDSrqB4C0DuAW7UuK4LDa5ri7fKMfHfxU4BGbg+S5U1mFP//TVX1W
 uwnPb091p1CrK25YPL7ccC/tDMIVmWmqCUuT4Kg3kt6NtMuZ64DTnvu5bDHDTAuLNcq1dbyYjCf
 uaOOsliBtmiyUZQD9LKj9Zr93LKTTfkNdUPDBY5I0DG6sUkHCJgjRVIMsz3XsFgvuCsik+qFXsh
 +pCMRiQ5cecTPasUN8HeImDqU+r63+yG/msc5wlh+V7S8BDtHQUbyW+eauYFk3f7uqB2OYSsrTW
 Su6rlhbydgnIih+mNNEGBGDiPHgn7Rgh0sgc8+Vq48EGOWQsCShFiIonvZFsv67rCX1cPDSCDJb
 AnS4eONQcgO3XaOWxsa0uz6BHMRc43b0sz/x80mY35YJV+zWjXS1VNllWr/R5Ot+vr6CMx1Lytl
 7LFNzc9DplGqXkPZobQ==
X-Proofpoint-GUID: NEJ1vIftbMsIxuQ3LNAd3ohLQ1XRpE0C
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb0ecb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=8D0aWHW-DKab9n6p2hgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: NEJ1vIftbMsIxuQ3LNAd3ohLQ1XRpE0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030
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

On 22/10/26 15:06, Anton Johansson via qemu development wrote:
> mstatus and mstatus_hs are uint64_t but accessed through
> 
>    tcg_gen_[ld|st]_tl(..., offsetof(mstatus))
> 
> which on a big-endian host running riscv32 incorrectly accesses the
> top 32 bits rather than the lower bits.

   mstatus and mstatus_hs are uint64_t, but mark_fs_dirty() and
   mark_vs_dirty() update them with tcg_gen_[ld|st]_tl().
   On big-endian hosts with 32-bit target_ulong, this modifies
   the upper half instead of the lower one, so the FS/VS dirty
   bits are never set. Use 64-bit accesses instead.

Cc: qemu-stable@nongnu.org
Fixes: 284d697c74e ("target/riscv: Merge m/vsstatus and m/vsstatush into 
one uint64_t unit")
Fixes: 8e1ee1fb571 ("target/riscv: rvv-1.0: add translation-time vector 
context status")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Widen the operations to 64 bit so the lower bits are modified.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/tcg/translate.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index ede9c2563f..79b0f444ef 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -693,7 +693,7 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
>    */
>   static void mark_fs_dirty(DisasContext *ctx)
>   {
> -    TCGv tmp;
> +    TCGv_i64 tmp;
>   
>       if (!has_ext(ctx, RVF)) {
>           return;
> @@ -703,15 +703,15 @@ static void mark_fs_dirty(DisasContext *ctx)
>           /* Remember the state change for the rest of the TB. */
>           ctx->mstatus_fs = EXT_STATUS_DIRTY;
>   
> -        tmp = tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -        tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tmp = tcg_temp_new_i64();
> +        tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
> +        tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
> +        tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
>   
>           if (ctx->virt_enabled) {
> -            tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
> -            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -            tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
> +            tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
> +            tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
> +            tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
>           }
>       }
>   }

Wondering about being safe (or catching other bad uses)

#define TCG_ENV_OFS_(f)     offsetof(CPUArchState, f)
#define TCG_ENV_SIZE_(f)    sizeof_field(CPUArchState, f)

#define tcg_gen_ld_env_tl(ret, f)                               \
     do {                                                        \
         QEMU_BUILD_BUG_ON(TCG_ENV_SIZE_(f) !=                   \
                           sizeof(target_ulong));                \
         tcg_gen_ld_tl(ret, tcg_env, TCG_ENV_OFS_(f));           \
     } while (0)

#define tcg_gen_ld_env_i64(ret, f)                              \
     do {                                                        \
         QEMU_BUILD_BUG_ON(TCG_ENV_SIZE_(f) != 8);               \
         tcg_gen_ld_i64(ret, tcg_env, TCG_ENV_OFS_(f));          \
     } while (0)

or even using _Generic:

#define TCG_ENV_FIELD_(f)   (((CPUArchState *)0)->f)
#define TCG_ENV_OFS_(f)     offsetof(CPUArchState, f)

#define tcg_gen_st_env_i32(arg, f)                              \
     _Generic(TCG_ENV_FIELD_(f),                                 \
              bool:     tcg_gen_st8_i32,                         \
              uint8_t:  tcg_gen_st8_i32,                         \
              int8_t:   tcg_gen_st8_i32,                         \
              uint16_t: tcg_gen_st16_i32,                        \
              int16_t:  tcg_gen_st16_i32,                        \
              uint32_t: tcg_gen_st_i32,                          \
              int32_t:  tcg_gen_st_i32)                          \
         (arg, tcg_env, TCG_ENV_OFS_(f))

#define tcg_gen_st_env_i64(arg, f)                              \
     _Generic(TCG_ENV_FIELD_(f),                                 \
              uint64_t: tcg_gen_st_i64,                          \
              int64_t:  tcg_gen_st_i64)                          \
         (arg, tcg_env, TCG_ENV_OFS_(f))

#if TARGET_LONG_BITS == 32
# define tcg_gen_ld_env_tl  tcg_gen_ld_env_i32
# define tcg_gen_st_env_tl  tcg_gen_st_env_i32
#else
# define tcg_gen_ld_env_tl  tcg_gen_ld_env_i64
# define tcg_gen_st_env_tl  tcg_gen_st_env_i64
#endif

Then replacing (a cheap replacement that can be done with coccinelle
spatch):

@@ -704,14 +757,14 @@ static void mark_fs_dirty(DisasContext *ctx)
          ctx->mstatus_fs = EXT_STATUS_DIRTY;

          tmp = tcg_temp_new();
-        tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_ld_env_tl(tmp, mstatus);
          tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
-        tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_st_env_tl(tmp, mstatus);

          if (ctx->virt_enabled) {
-            tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, 
mstatus_hs));
+            tcg_gen_ld_env_tl(tmp, mstatus_hs);
              tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
-            tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, 
mstatus_hs));
+            tcg_gen_st_env_tl(tmp, mstatus_hs);
          }
      }

triggers:

FAILED: [code=1] libqemu-riscv32-softmmu.a.p/target_riscv_tcg_translate.c.o
../target/riscv/tcg/translate.c:760:9: error: controlling expression 
type 'uint64_t' (aka 'unsigned long long') not compatible with any 
generic association type
   760 |         tcg_gen_ld_env_tl(tmp, mstatus);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:86:29: note: expanded from macro 
'tcg_gen_ld_env_tl'
    86 | # define tcg_gen_ld_env_tl  tcg_gen_ld_env_i32
       |                             ^
../target/riscv/tcg/translate.c:45:14: note: expanded from macro 
'tcg_gen_ld_env_i32'
    45 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:41:29: note: expanded from macro 
'TCG_ENV_FIELD_'
    41 | #define TCG_ENV_FIELD_(f)   (((CPURISCVState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:762:9: error: controlling expression 
type 'uint64_t' (aka 'unsigned long long') not compatible with any 
generic association type
   762 |         tcg_gen_st_env_tl(tmp, mstatus);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:87:29: note: expanded from macro 
'tcg_gen_st_env_tl'
    87 | # define tcg_gen_st_env_tl  tcg_gen_st_env_i32
       |                             ^
../target/riscv/tcg/translate.c:69:14: note: expanded from macro 
'tcg_gen_st_env_i32'
    69 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:41:29: note: expanded from macro 
'TCG_ENV_FIELD_'
    41 | #define TCG_ENV_FIELD_(f)   (((CPURISCVState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:765:13: error: controlling expression 
type 'uint64_t' (aka 'unsigned long long') not compatible with any 
generic association type
   765 |             tcg_gen_ld_env_tl(tmp, mstatus_hs);
       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:86:29: note: expanded from macro 
'tcg_gen_ld_env_tl'
    86 | # define tcg_gen_ld_env_tl  tcg_gen_ld_env_i32
       |                             ^
../target/riscv/tcg/translate.c:45:14: note: expanded from macro 
'tcg_gen_ld_env_i32'
    45 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:41:29: note: expanded from macro 
'TCG_ENV_FIELD_'
    41 | #define TCG_ENV_FIELD_(f)   (((CPURISCVState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:767:13: error: controlling expression 
type 'uint64_t' (aka 'unsigned long long') not compatible with any 
generic association type
   767 |             tcg_gen_st_env_tl(tmp, mstatus_hs);
       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:87:29: note: expanded from macro 
'tcg_gen_st_env_tl'
    87 | # define tcg_gen_st_env_tl  tcg_gen_st_env_i32
       |                             ^
../target/riscv/tcg/translate.c:69:14: note: expanded from macro 
'tcg_gen_st_env_i32'
    69 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
../target/riscv/tcg/translate.c:41:29: note: expanded from macro 
'TCG_ENV_FIELD_'
    41 | #define TCG_ENV_FIELD_(f)   (((CPURISCVState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
4 errors generated.


