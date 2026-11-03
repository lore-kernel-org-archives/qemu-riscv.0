Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE4606A328
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ET9oKiyR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exBpHfM8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOHnN-00021W-Qb; Tue, 03 Nov 2026 11:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOHnJ-00020p-Lw
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 11:55:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOHnH-0003a4-1A
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 11:55:33 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3G6Boa3337277
 for <qemu-riscv@nongnu.org>; Tue, 3 Nov 2026 16:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pg/Fn37HUJYh9o/8jX4eOn5CZLB43T+s7H37OxiOwVo=; b=ET9oKiyR1gTayHXy
 QFsH8dK+2RTASDlYnzD4MPN6PFP40Zc5N7vO/QjFhLRRozWYBMUp+mc2kyZqxn4R
 BFF6Ag/5VUyiu7IzHiYTqd6kEjYRUcZV0uaLBvvurmy3RP21zDn8PhdTAqjNeyAR
 4p15/3l2lT7/5a/UHHkodOBvNelRtNBR596ulQBQ3bZqvvT3cEJiHPFE7N50qTTh
 +fw9NHYvV+Huy/bJzDSRck07i0H/2fw5wtOtvvSZOEfHe/VcOe7NKKfxcmMa3RWG
 xFme1JjwAaDR1pOFC+k7Y46xwO6s35qAXO2tTQmsNlIxxW8DDfSVDYy/2CbvDOVr
 XXC9WA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubg75r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 16:55:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-988bc0ef0easo882652241.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 08:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793724928; x=1794329728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pg/Fn37HUJYh9o/8jX4eOn5CZLB43T+s7H37OxiOwVo=;
 b=exBpHfM8///xOQEBv6uwDCVYxveXlMEQBDLGDFhnON7EtcXPtkE4ogHkom/pHrQNc1
 hCFrQTJewS2qmZkVe15fEfq6uLZ56+uTu5wItCR3F3H6DrNXiz6zkl6QrM7gNIWhUYcw
 ib2SZ6/zIEuAb9LnW6Kalk95g5QsN7u9bLf1oHvcR8cymko5ouW0a4OdiDJn8+8KstUD
 y1oIcgpe9EHCfNyRoHxZjtgCQHgQ3Xo4O2w7fmHB3aa7sm/xBUWNl/r1yvRI/zMXLNav
 rPCZQppnx/BFXsUmxK5XCXi883+Uj1qmOsT1SW1XQI7/gMp03BdpDPg91LWAVvkPeUFz
 hpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793724928; x=1794329728;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pg/Fn37HUJYh9o/8jX4eOn5CZLB43T+s7H37OxiOwVo=;
 b=RjqYDiJjVQQnxX/lUyoh97Wod7CbDx//yZHpgLK7yb6Q4Zdzc9Cwf7D6oPg07y4yZY
 v+zFJjB8neTdOhDL3396Tm3wrJhY2LjpFq4Tlt8hIM0ItLsH42sbU8/KKWoH5uWhJLE+
 i8Wvvb2vxcrHGdDrBkCekBap7J5JWzXFvoH1nDQr1lWZHrjoC2iaL3ahexD4DKhFE1m8
 gslvKg8xUhyjWR9uu4ZUq06tkbBPgIKbsAsQUdSurzvfmhI/QKUfMyH23XPHYs+pR0kV
 mSBTYWFhuYPpHxdIppTOyGqheP/yIp8LliEAWMZpoOwn8Ep0Vze+5ozjmoEtnbmesrLX
 EJCA==
X-Forwarded-Encrypted: i=1;
 AKwUvByTlj/xZXgsZWu1MuaGUuif2SAlIY0VXYw53qb5hwIuNbc18+CvUa7JI5eG5hVO4TAXPSaY3DX5OzJt@nongnu.org
X-Gm-Message-State: APuU4Z8pgnl+elQlAeJUzj/Tdg9ze+JzA9jASgSQci8bZpVPey1pJNpl
 axdjZwo/OxWsLhyedBFxQyLXTCVGX2IA4lZ7hJuc9lJr0MmoZ8Ix/XbYmO8qh31iwFxprn90lfO
 Ob5RthsuakkK6nnAvHSGIpBTyWo9x7RlMAMfxODUgGMgfc9OXEp9JjjI1Jg==
X-Gm-Gg: AYBFou2J+VxQsZb89F0u4qMi5fM+c8Wrd0gW8ivkSnb3cKvhxAOJAYC3nWzyKM2YeoU
 G5ImC04CAgQOKRnl29+vxOAdTlowuyYN0ElrMTpsslBAHhfwIyiQYJGmeGbja/MsL9QH706XcmV
 9WgBrVnAKs6bsOWQxJFpzGkEcrkU6lFi+5+EiDvBCLjiP2PV5/Ossyz9UadH0aIeE5Fk3j/NLhj
 D6ke3wCu8McGHQJ8zuLuV3JdetsVHxIlP4w2S43JRgAkz+71mZqwkLWVARE3XEyRmyd1Kq6i+aU
 MIfAUyc57EZ6Ha6rr3ubh++QXI1J+dSMIDFgAs1a1T/x4MylpEiQopE+rQiQ6DwQfaK+aHiRIB+
 NAHP5yAGJSnYFtzcl/D4vSffVA+XNijkILv8Rn2+HgwkwUHPkv2DqRWep/4oL3e45wEzgSlKOwv
 8OUFlK9GzK
X-Received: by 2002:a05:6102:512c:b0:7ce:6474:720b with SMTP id
 ada2fe7eead31-7d07272e9a4mr4531450137.23.1793724928324; 
 Tue, 03 Nov 2026 08:55:28 -0800 (PST)
X-Received: by 2002:a05:6102:512c:b0:7ce:6474:720b with SMTP id
 ada2fe7eead31-7d07272e9a4mr4531438137.23.1793724927737; 
 Tue, 03 Nov 2026 08:55:27 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.253])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7d1cf09b4e6sm514158137.4.2026.11.03.08.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 08:55:27 -0800 (PST)
Message-ID: <b8da8748-a668-4481-b483-66f333a0614b@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 13:55:24 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add support for the hcontext CSR
To: Arseniy Semenov <ar.semenov@outlook.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "antikostya2@gmail.com" <antikostya2@gmail.com>
References: <2b1cfd78-2a92-4077-9ab1-a2c865d6d673@outlook.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2b1cfd78-2a92-4077-9ab1-a2c865d6d673@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NyBTYWx0ZWRfX2fP1X8/VNdxC
 lsOx5Yx1qlHhV0pPAHkyUz8wiFQ1UWbkEQlmi9+WXXL5N3WNkd16jRm82x8QKUxBUu/BoS0C2AI
 /vNIP4LlhgD7zXqvpFPidT7905Ta2iI=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea1201 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=LQvE5zGBNe+6ot3hfEwogQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=vnr7sMAykzA4DXE1U6EA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 6cLe3MBnY1mUJFfKkrA_niz2pK71-IKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NyBTYWx0ZWRfX7crr9ckuc1BB
 kUF7SkPj6B/HmdS7ruSZnQaxGTMgW/hsQwSlhvtR7DjzBAsDB1AUTxLKDNbJ3vAskyiVEE/m58F
 ukF4TRTwvbk4Nr8yoDDckMAHuuxwJzcVTVkplQqbUfTJRbVscrvb+iEnPL5Zg9Ha2OjUxbYVOZs
 b/HEZBX+8vb8OIFIWaaQi+4HUPYboquG4jDBvmzx+zh7rjk2tgotFMzulDn3n4oAEDH7Bk8Tgk2
 pSv6RK9vSEIe+kfT3eoOcpWqmPFh9RgPqY/FboY/gTL60oCoZHWXS2kL16l1IR4MTl5DbKVjzXE
 xLuT9KM6cjG0yJuuN45vLyEFOjy35XW6TYgISrl1ytSnYwKU/MDkrnC+H7uRWod8OvAQ9aGtca4
 YMxVb0f2GBQ8tA8iO7HY70dgzYsSrA3xn1cPZ4kvd4itDsGiihnYf1p2USw4zXl7CkvV3+wwuVG
 aTe8TZGvWV+iNCuOe6Q==
X-Proofpoint-ORIG-GUID: 6cLe3MBnY1mUJFfKkrA_niz2pK71-IKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030067
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



On 10/30/2026 2:25 PM, Arseniy Semenov wrote:
> Implement the hypervisor context (hcontext) register described in
> "The RISC-V Debug Specification" Version 1.0.  The hcontext CSR is
> accessible from H and M mode, gated by the Smstateen HSCONTXT bit.
> Writes are masked to the width mandated by the RV32/RV64 xlen.
> 
> Signed-off-by: Arseniy Semenov <ar.semenov@outlook.com>
> ---
> This series adds emulation support for the hypervisor context (hcontext)
> register, as specified in "The RISC-V Debug Specification" Version 1.0.
> 
> The hcontext CSR (0x6a8) is a read/write register accessible from H and M
> mode, whose value is derived from the mcontext register.  Accesses are
> gated behind the Smstateen HSCONTXT enable bit and writes are masked to
> the xlen-dependent width defined by the spec.
> 
> No behaviour change occurs when the H extension is not enabled.
> ---
>    target/riscv/cpu_bits.h |  1 +
>    target/riscv/tcg/csr.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>    2 files changed, 47 insertions(+)
> 
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 3579789a1f..bfa10afca8 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -456,6 +456,7 @@
>    #define CSR_MNSTATUS        0x744
>    
>    /* Debug/Trace Registers (shared with Debug Mode) */
> +#define CSR_HCONTEXT        0x6a8
>    #define CSR_TSELECT         0x7a0
>    #define CSR_TDATA1          0x7a1
>    #define CSR_TDATA2          0x7a2
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 063590f56a..db1c8e58f4 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -814,6 +814,16 @@ static RISCVException debug(CPURISCVState *env, int csrno)
>        return RISCV_EXCP_ILLEGAL_INST;
>    }
>    
> +static RISCVException hmode_debug(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_has_ext(env, RVH) &&
> +        (riscv_cpu_cfg(env)->debug || riscv_cpu_cfg(env)->ext_sdtrig)) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
>    static RISCVException rnmi(CPURISCVState *env, int csrno)
>    {
>        RISCVCPU *cpu = env_archcpu(env);
> @@ -5703,6 +5713,40 @@ static RISCVException write_mcontext(CPURISCVState *env, int csrno,
>        return RISCV_EXCP_NONE;
>    }
>    
> +static RISCVException read_hcontext(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSCONTXT);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }

I am not sure if this smstateen check is correct.  Sdtrig spec says:

------------
Hypervisor Context (hcontext, at 0x6a8)

This optional register may be implemented only if the H extension is implemented.
If it is implemented, mcontext must also be implemented.

This register is only accessible in HS-Mode, M-mode and Debug Mode. If Smstateen is
implemented, then accessibility of in HS-Mode is controlled by mstateenzero[57].
------------

Note that smstateen check is only relevant for HS-Mode.  M-mode and Debug mode
must have access to the reg regardless of Smstateen.


> +
> +    *val = env->mcontext;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_hcontext(CPURISCVState *env, int csrno,
> +                                     target_ulong val, uintptr_t ra)
> +{
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSCONTXT);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }

Same 'smstateen' observation from above.


> +
> +    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;


I suggest doing the short version:

bool rv32 = riscv_cpu_mxl(env) == MXL_RV32;



Thanks,
Daniel


> +
> +    target_ulong mask = rv32 ? MCONTEXT32_HCONTEXT : MCONTEXT64_HCONTEXT;
> +
> +    env->mcontext = val & mask;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>    static RISCVException read_mnscratch(CPURISCVState *env, int csrno,
>                                         target_ulong *val)
>    {
> @@ -6620,6 +6664,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>        [CSR_TDATA3]    =  { "tdata3",   debug, read_tdata,    write_tdata    },
>        [CSR_TINFO]     =  { "tinfo",    debug, read_tinfo,    write_ignore   },
>        [CSR_MCONTEXT]  =  { "mcontext", debug, read_mcontext, write_mcontext },
> +    [CSR_HCONTEXT]  =  { "hcontext", hmode_debug,
> +                         read_hcontext, write_hcontext },
>    #if !defined(CONFIG_USER_ONLY)
>        [CSR_DCSR]      =  { "dcsr",      sdext, read_dcsr,     write_dcsr },
>        [CSR_DPC]       =  { "dpc",       sdext, read_dpc,      write_dpc },
> 
> ---
> base-commit: a19f59a72d96056d9a8f48cf6c77f5787491e414
> change-id: 20261019-hcontext-e8e8f54989a4
> 
> Best regards,
> --
> Arseniy Semenov <ar.semenov@outlook.com>
> 


