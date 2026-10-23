Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C9606A320
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R/YrFlX8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8FOdQhH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKAM8-0005cV-I8; Fri, 23 Oct 2026 04:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xKAM4-0005cA-UU
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 04:10:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xKAM1-0004K8-EN
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 04:10:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69N7FDJm1767187
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 08:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iwyOohHfwuWp4vYSVVpJnoG04CQwNPpTI3auB/8ECpk=; b=R/YrFlX8Dj4ljTlQ
 5iCN03SsRRiqrlNiMv+5MV1Yr/7Z4iYSLr6pn9oLzmSgRc8j62hJvjams3UjFNno
 IPG+bpTuaQRijqWPXGqLv2B+x66dQWZW4B7L/gB/CzFaV+oQYX0Ud9J8Zo3PVjU+
 wlFBi9eT94XhvVf/vHSKvfZR4W6k//L2YxKtxXGuvYYBcAG2GuJ5nXcg3H9pbiT8
 MRsw/xoQ7ug2Fl7P4YbL3fn5I6sAMHiTFO8CLVfKNwVil1ScpCe8wxPBhDyMAc5O
 KDrIr4IuX0PK2JYr7kP0kWTqBO8gZWq/y589j6FDORfcxABZ2pUbxKY1j9dQiSNQ
 3dMX9A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3bt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 08:10:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91792488228so13890436d6.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792743019; x=1793347819; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iwyOohHfwuWp4vYSVVpJnoG04CQwNPpTI3auB/8ECpk=;
 b=Y8FOdQhHkgkKyagbemVKf2A58QPSPJCz8bMwOi6aXbmCg/YDq+QUFKPsOBWZz9ANXT
 L/0gHL2rxzaTKgfsVMHhSmJPNzGbGNZnFNtb4RC+ZvMG9Y1EM8+v/7hPoNFccqjQquEA
 zwJS8UtH4KumOhiVpfrR57BN/C6f//OyKE85dvO/ApyvHss/7I8sQXcBG7htc3NsQGvf
 coafrh/+ciJkUFMDSc81fbZNT9Ltblp4mg6lMs2AdKWnda7t7AxaToGflqeA3ysOejcc
 WkVAS1doY3ivbE6mahUptKliWiK8gE0lrIowKCbwjWhWYAK4zykfbMxGTNbTvsKi7txv
 X6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792743019; x=1793347819;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iwyOohHfwuWp4vYSVVpJnoG04CQwNPpTI3auB/8ECpk=;
 b=mTPlDA5iLTLdKMP0HdI2zlx+pxHg/P8UhIBG8yO7MIwrhjaaw09at3rmK7uH/dWD0j
 sL/1jyOkxBC1dwdLPO3LXdCHZFJ7oia31RmzH/kgXNkLUbpeAWfNAPq6rnm8zdPzY+8b
 ZCx3rGpXOX7TdKr5iL6Fl9T9hdnIBgTBviJK2rJu59oIIYU/TNRF5JUUr4LeAr6eBCyg
 JmaUpJlsZoj+maM3i4vccipWHnaElIet98ZK0g5nChurdcyc1USl4rDdSZVo/Vca4llF
 hH5a2RdYj+KnuyYa5xW2cemp23FbpqEVzFIBSpl7OuXmQhihhqUiXoeFGbw8yfAsoMXF
 Gafg==
X-Gm-Message-State: AFq9FYLEg7UC3P0QSc4WdKK1HMqK6SyOwX7mOX9jyqVDjy5eCRRv9ov/
 lCVbzuTCILpEVJYaHAd6UzjqwtY9nQy3/5MWXTdWDd0pm+KWaaBfZHz7TS7slBGtvJzpaLCaI6O
 8DiCtWsxmfZCnYi1WXfQ3t4HQfvTyiOQx32ToK6B9OM7ht5kGLwgjJogapw==
X-Gm-Gg: AYBFou25Sl4DWEwcicttFoKGQOERNCLAZ8LmEzXw0b9+U/854gCVAWJs/ONdu1esLNY
 QrSkvwaOAy6Wy8XwFb3XxVmIEXT/M2mJcJmZ5uQ1txmnRZ+8E9XbzEAz8H6Bcqc0OzKw24WcGpu
 ZLPJVmpsZeOT3CSvIIDFpEocF/1g76uoF4jH12iqke1Z7NgWbOgQ6qshfOD7DPE423UFFqgKpRq
 QBW6H45xXmmGJirMkmqo6ldvQx8BW530zERfE43s7Nn+fUQ1REND3DkS5IN8LXbUJcZH/QHxjnH
 4hhuKBSzGGJdjsgBMl7I5uPD6N81lxR0i9gNhZ6sJ46pMaDdNkRBoqrbenfK9xw1dRzLKkZdDp0
 m7F/StjAjaSJdtwg1xRVb3NQ0dbmv1XijAw==
X-Received: by 2002:a05:620a:601b:b0:93e:592d:f5a2 with SMTP id
 af79cd13be357-93f6f589c7bmr294315285a.11.1792743018891; 
 Fri, 23 Oct 2026 01:10:18 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:93e:592d:f5a2 with SMTP id
 af79cd13be357-93f6f589c7bmr294313185a.11.1792743018408; 
 Fri, 23 Oct 2026 01:10:18 -0700 (PDT)
Received: from [192.168.69.209] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a210299910sm57372065e9.1.2026.10.23.01.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 01:10:17 -0700 (PDT)
Message-ID: <ee2dfd4c-b3aa-4157-a918-560895048422@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:10:16 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix CPU state access on big-endian hosts
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20261022130657.6449-1-anjo@rev.ng>
 <3d9baf66-d412-439a-b9db-099124af6625@oss.qualcomm.com>
 <8299629b-7033-485c-8204-521e14e2f1d8@oss.qualcomm.com>
 <a7eb7b51-55ec-49e4-a4cc-209c41236c91@oss.qualcomm.com>
In-Reply-To: <a7eb7b51-55ec-49e4-a4cc-209c41236c91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX1cg3SC8QBKFT
 Rm8LKekjDbAG16PrRcDwxAZguASTLv/C3SODEnxKm0pIdZ1G2fECP84nyGCYeeEKX2xL3Sqr+wO
 31WalwD9eYxJl2g7eHrBuGSFxzpIvpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX2+YMarGUcEF9
 x8c+Gf2hRENhMvoOEGlQvbsCbeXx52KIYrya6B7OeBzt71VpY0jD13eHHCjMicJfIEuWjH/29Vm
 pa+bWeGVXMXH9rgOUyKZVs3VWPCfBZUMwLDCFxCGUukv+4lj02fHbyzmLH9JY8WFkTVzCMQ+d6F
 I3KUzVCe4h6/aEmikvPmye1Vlob3M5m3haqZWWXU+/yp1CtFqfCAQ/LtIhbBRCNaM0sr0Gagra/
 mCxw9PelA4S8+ihriNUcuHUXMJmPVz9RPi53LBVMV7GP7KYEnBRvz0HpcG/IyL6I5PXN0OnnTke
 8z8iknBCmfHyQfu/li5KsD1Cjkb9D9I0Z6H+6emvYRo3AoQDqWBsQaK+dUIWAXbsWTapu2U37tJ
 ZGQ9KFSkm5NJo+ZGoFujx7jvWxVZSiUQVhL0xbFUn5pWVwCVYL6q3945dGdvLSnZChyZ/imdKV2
 C2RaBMRyOaztsxZZy4w==
X-Proofpoint-GUID: LjDOs0YACpNPCavJo6ayh1sd3EyGjOuo
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb166b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=_34PnbzofrPf3qbb8vkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: LjDOs0YACpNPCavJo6ayh1sd3EyGjOuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032
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

On 23/10/26 10:07, Philippe Mathieu-DaudÃ© wrote:
> On 23/10/26 09:53, Philippe Mathieu-DaudÃ© wrote:
>> On 23/10/26 09:37, Philippe Mathieu-DaudÃ© wrote:
>>> On 22/10/26 15:06, Anton Johansson via qemu development wrote:
>>>> mstatus and mstatus_hs are uint64_t but accessed through
>>>>
>>>>    tcg_gen_[ld|st]_tl(..., offsetof(mstatus))
>>>>
>>>> which on a big-endian host running riscv32 incorrectly accesses the
>>>> top 32 bits rather than the lower bits.
>>>
>>>    mstatus and mstatus_hs are uint64_t, but mark_fs_dirty() and
>>>    mark_vs_dirty() update them with tcg_gen_[ld|st]_tl().
>>>    On big-endian hosts with 32-bit target_ulong, this modifies
>>>    the upper half instead of the lower one, so the FS/VS dirty
>>>    bits are never set. Use 64-bit accesses instead.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Fixes: 284d697c74e ("target/riscv: Merge m/vsstatus and m/vsstatush 
>>> into one uint64_t unit")
>>> Fixes: 8e1ee1fb571 ("target/riscv: rvv-1.0: add translation-time 
>>> vector context status")
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>>>
>>>> Widen the operations to 64 bit so the lower bits are modified.
>>>>
>>>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>>>> ---
>>>>   target/riscv/tcg/translate.c | 32 ++++++++++++++++----------------
>>>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/ 
>>>> translate.c
>>>> index ede9c2563f..79b0f444ef 100644
>>>> --- a/target/riscv/tcg/translate.c
>>>> +++ b/target/riscv/tcg/translate.c
>>>> @@ -693,7 +693,7 @@ static TCGv get_address_indexed(DisasContext 
>>>> *ctx, int rs1, TCGv offs)
>>>>    */
>>>>   static void mark_fs_dirty(DisasContext *ctx)
>>>>   {
>>>> -    TCGv tmp;
>>>> +    TCGv_i64 tmp;
>>>>       if (!has_ext(ctx, RVF)) {
>>>>           return;
>>>> @@ -703,15 +703,15 @@ static void mark_fs_dirty(DisasContext *ctx)
>>>>           /* Remember the state change for the rest of the TB. */
>>>>           ctx->mstatus_fs = EXT_STATUS_DIRTY;
>>>> -        tmp = tcg_temp_new();
>>>> -        tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
>>>> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>>>> -        tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus));
>>>> +        tmp = tcg_temp_new_i64();
>>>> +        tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus));
>>>> +        tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
>>>> +        tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus));
>>>>           if (ctx->virt_enabled) {
>>>> -            tcg_gen_ld_tl(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus_hs));
>>>> -            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>>>> -            tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus_hs));
>>>> +            tcg_gen_ld_i64(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus_hs));
>>>> +            tcg_gen_ori_i64(tmp, tmp, MSTATUS_FS);
>>>> +            tcg_gen_st_i64(tmp, tcg_env, offsetof(CPURISCVState, 
>>>> mstatus_hs));
>>>>           }
>>>>       }
>>>>   }
>>>
>>> Wondering about being safe (or catching other bad uses)
>>>
>>> #define TCG_ENV_OFS_(f)     offsetof(CPUArchState, f)
>>> #define TCG_ENV_SIZE_(f)    sizeof_field(CPUArchState, f)
>>>
>>> #define tcg_gen_ld_env_tl(ret, f)                               \
>>>      do {                                                        \
>>>          QEMU_BUILD_BUG_ON(TCG_ENV_SIZE_(f) !=                   \
>>>                            sizeof(target_ulong));                \
>>>          tcg_gen_ld_tl(ret, tcg_env, TCG_ENV_OFS_(f));           \
>>>      } while (0)
>>>
>>> #define tcg_gen_ld_env_i64(ret, f)                              \
>>>      do {                                                        \
>>>          QEMU_BUILD_BUG_ON(TCG_ENV_SIZE_(f) != 8);               \
>>>          tcg_gen_ld_i64(ret, tcg_env, TCG_ENV_OFS_(f));          \
>>>      } while (0)
>>>
>>> or even using _Generic:
>>>
>>> #define TCG_ENV_FIELD_(f)   (((CPUArchState *)0)->f)
>>> #define TCG_ENV_OFS_(f)     offsetof(CPUArchState, f)
>>>
>>> #define tcg_gen_st_env_i32(arg, f)                              \
>>>      _Generic(TCG_ENV_FIELD_(f),                                 \
>>>               bool:     tcg_gen_st8_i32,                         \
>>>               uint8_t:  tcg_gen_st8_i32,                         \
>>>               int8_t:   tcg_gen_st8_i32,                         \
>>>               uint16_t: tcg_gen_st16_i32,                        \
>>>               int16_t:  tcg_gen_st16_i32,                        \
> 
> Hmm tricky (dangerous?), this also change our current uses of
> target-long accesses to smaller fields. This is how I'd expect
> the uses but not always what we have now. For example, commit
> ebc9401a406 ("target/hppa: Split PSW X and B into their own
> field") reduced CPUHPPAState::psw from uint64_t to uint32_t,
> but both accessors -- trans_rsm() and trans_ssm() -- keep
> accessing with tcg_gen_ld_i64() instead of tcg_gen_ld32u_i64().
> Likely buggy wrt endianness.

Noticed because the coccinelle conversion now triggers:

../target/hppa/translate.c:2367:5: error: controlling expression type 
'uint32_t' (aka 'unsigned int') not compatible with any generic 
association type
  2367 |     tcg_gen_ld_env_i64(tmp, psw);
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/Users/philmd/worktree/qemu/excp/include/tcg/tcg-op-env.h:30:14: note: 
expanded from macro 'tcg_gen_ld_env_i64'
    30 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
/Users/philmd/worktree/qemu/excp/include/tcg/tcg-op-env.h:15:29: note: 
expanded from macro 'TCG_ENV_FIELD_'
    15 | #define TCG_ENV_FIELD_(f)   (((struct CPUArchState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../target/hppa/translate.c:2387:5: error: controlling expression type 
'uint32_t' (aka 'unsigned int') not compatible with any generic 
association type
  2387 |     tcg_gen_ld_env_i64(tmp, psw);
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/Users/philmd/worktree/qemu/excp/include/tcg/tcg-op-env.h:30:14: note: 
expanded from macro 'tcg_gen_ld_env_i64'
    30 |     _Generic(TCG_ENV_FIELD_(f),                                 \
       |              ^~~~~~~~~~~~~~~~~
/Users/philmd/worktree/qemu/excp/include/tcg/tcg-op-env.h:15:29: note: 
expanded from macro 'TCG_ENV_FIELD_'
    15 | #define TCG_ENV_FIELD_(f)   (((struct CPUArchState *)0)->f)
       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2 errors generated.


