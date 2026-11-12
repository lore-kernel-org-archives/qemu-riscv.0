Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC6606A321
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f03jOfrr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjUmwDvX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRMss-00065b-DA; Wed, 11 Nov 2026 23:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRMsZ-00063L-9o
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 23:57:46 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRMsU-0003qv-T6
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 23:57:43 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC2aWUB1475415
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 awFmQAiSAkWCZcfpvwhuKL0vxSdoVCJmH5XSBAjzU7E=; b=f03jOfrrUK9MXhcg
 xfQ7XWvywmuWnlFuHIeRL99/J2Bk8vwZeYwDGr+O0QflsU20mc2sEu8FTPK91HBU
 b1JwQVi7sXoFKMyVXfhhF4S4MANtwtp4um9NK061oSHl4V3YmLbaIt5kmjWEQlcx
 ZhlgV7HFjasU2gsKvo++MvPtFZCHeuVgjdGNNdwBwphbRgnduIMBhDlJtWjlMBmB
 FlePD4fILHgKUeIyjD4z3B4Nx2ScPcbWEp2PWDydCHVpFUWeSdFJRMM348ti40a7
 3zY6yDe752xTL/Gz57k2h+ROcEeFfM7Fde52t9GMzbqYuNlVPM+vL9STcgblGUAk
 kqY/Mg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtpns-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 04:57:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91f0938c499so31825636d6.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 20:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794459456; x=1795064256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=awFmQAiSAkWCZcfpvwhuKL0vxSdoVCJmH5XSBAjzU7E=;
 b=SjUmwDvXy+pJstlXnvIxEX9mgnDHYnnhXUBLXJRz3dxerg+rbvkKv6rk2Uau/5pkpY
 IY+8QIZSoAdCzBwJYTOFZTs3F/SdWNYL3Z+d2ukoIBiMa6kgQgpOxVPLoW0ynBhOhq4D
 +/oAINRxp9+O4GCTXMST6rjC5vzpD2ND5rA24rZTl9WKTLkSM4SIoXmHM9qrph5lYsx0
 dLKFLFLDkCGXO1m2u/azmQi3w2ub/8JnC0gjyVGBzAJ75t8c/pZDTLzqoxHcXYz7daPm
 J1d95DCqWMJL315p2ePENrG6qZo1OF0YtpvkAaEP5ZpAa1/N+owZM07sWFoA1JBgETSR
 Fd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794459456; x=1795064256;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=awFmQAiSAkWCZcfpvwhuKL0vxSdoVCJmH5XSBAjzU7E=;
 b=dL91HZtZo522Ckb9+E1Xw3YyV7/CwNLGLP0PcMV6ULj+PQV4xva0TU0fxkK8CCwRU7
 Hy67XzWCr0wg564ByPnTGbI9veOppSpNK90n60MkbZoVxhrAG8OUgviXVgwL4EK5bXEp
 EzeESNxqFGw/lQ4YyvoHWPuE57ZHbj/qdUb/dHpMyV+AyfodkFEzbDLf/ds9w8NI/Y6K
 1WJYbpYR0zhiWe4ctazV5bctoo08jhp1lw+Y//+8A/dPoUjHDBqjnrLAvTDkdo6o0Anv
 qmqHRRzcH5pot5sEBeBfY17MHhAzAPaF7C6Cho35EQK8obwll5M3kLbXT/WWfpBZltCm
 t0uQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHmNzOHMgy8uMnuUMHUovjn00804B0S0yz4ok5pbuiW6kaiQodyjafAYKD/I6LEDaW6SSGnM8C00Li0@nongnu.org
X-Gm-Message-State: APuU4Z8vIymEL8uwMwFaLVmkR8hfGitNDorgTHuz7etqSRxXymyyYV0v
 ubQMxuyDxHxpuWbFq5g9wTI5d1F84GB8q5+OGTtGKwq96GuyPaAYsmVP2zLv7mQbJIZO/aX9DC/
 1qiRsMsm/pEPDhqHbw1YcPLayaFj/aKrvfuOQeueGrucUQ5c4m1wgq8PgnQ==
X-Gm-Gg: AYBFou2JlypkkzsNfLEF1J7hUKjrrm0p4uBRsWKAHUzjhGpzrMo5THNfv/CCD5LVAoj
 ABTJfL6LQw6LlYAcAoewGer0aNpDukHTsDzWRwJkqvPhti2zVGiy6pNjuUS8M1LuOSrarPO/cPb
 sWP5vNExxuUj5eOSIVpLEHIi13nE1wKozBsFyIbIrSJvdnysNpX++ivrIhXL09IV8w08azxbuk+
 idd+zZWlkjji/hvlGfHH5oLRYBjdWQ82FejUiMVH1PVaOTMzN3mhwlCTHMTE7ftc7UfQKedd7g0
 6WAl3aCrNEfe6V1NvvVWqK8rDE0SthUqSLkpRhl2ufrUCPyHpamAsWx02t4NKrcJnzOzEthNP03
 E0rNgzHGW42UWW/5HAP6wyhYJ7VwNz8xx6DyRSYmXdHlWecOLqfJhC2PIQSkPaeqsOi5ayr2jhF
 gRymThH9s=
X-Received: by 2002:a05:6214:2f0e:b0:91f:288:b3dc with SMTP id
 6a1803df08f44-91f0404ae3bmr80730316d6.11.1794459456216; 
 Wed, 11 Nov 2026 20:57:36 -0800 (PST)
X-Received: by 2002:a05:6214:2f0e:b0:91f:288:b3dc with SMTP id
 6a1803df08f44-91f0404ae3bmr80730036d6.11.1794459455681; 
 Wed, 11 Nov 2026 20:57:35 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e28c882sm40909455e9.6.2026.11.11.20.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 20:57:34 -0800 (PST)
Message-ID: <fa097440-d725-44e3-9753-a6d500d50f8d@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 05:57:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tcg/riscv64: Fix vector constant matching for logical
 ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20261010174742.3552498-1-aurelien@aurel32.net>
 <9ca6f711-e886-46a5-80ea-a6c750696a93@oss.qualcomm.com>
 <auEeif_51q1K9XOz@aurel32.net>
 <d230ae93a44b63138389d07c355c2e8d3154acd7.camel@wdc.com>
 <548258ad-0e51-458a-827e-6b9c7d0f15d3@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <548258ad-0e51-458a-827e-6b9c7d0f15d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h22tSzkdunYlmy1wNdsfOIKQN2Rw6ibC
X-Proofpoint-ORIG-GUID: h22tSzkdunYlmy1wNdsfOIKQN2Rw6ibC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOSBTYWx0ZWRfXzGWTMaoUAA5p
 kv5ruKBQjriL0AfE2thVOMin2M8M+7/5NMw3Dm95x1d/Oz2H0yup8H1TsoEYCoQoGkbtx8ZzPnd
 9nZy0c8iRt7+w3sOVn1xX/vzJRN21FtJLjQltriIqe/K79U6mJbV/5a/uV40RXXG69G03ySf7Fb
 aeTDWTbmKFxDzNAHvKFVvNNPdhR7B6854CDlTuxYLpip19YcOdULNkScfwSO1GwRb7iOSAh2ar6
 UuH8sRjN/xZJqmLlZfWFhOKMDRURIDRuCsN+vVVCn+cd5qo5vatmjvJ6IyLHNkXYvA8BcKPYFhq
 hInE6mFQKrLdo7ZW9qGGTX2XICWIraQPNTsCiyzVYPvBp6PFqknF/1lhrkrJMipC3mklHdJk+Wj
 ueXks1G/9hzB1sIMmFVPrL9BoTqztqRdNSTwYu/yXdSiOP+vxkcW8EKpDC6zxiSK7gzJeaEtLsh
 EjDh7khuwmC8EQuhyFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOSBTYWx0ZWRfX+mTx8tc1pCHQ
 IjB+PLQraBWc3PEyDNWeQhpSCqrXioQdMCzrMZsszsfHilVfflvowFSr+mJnUAICO86R83pFtJU
 Li/NJ7+FW9z++p2POw9mTT7YKMoBEfU=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af54741 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=hXZgYZo4AAAA:8 a=EUspDBNiAAAA:8 a=Qn8w5v1CMwilkpd3a4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120019
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 04:29, Richard Henderson wrote:
> On 11/10/26 18:36, Alistair Francis wrote:
>> On Tue, 2026-10-27 at 22:58 +0100, Aurelien Jarno wrote:
>>> Hi Philippe,
>>>
>>> On 2026-10-24 19:00, Philippe Mathieu-Daudé wrote:
>>>> On 10/10/26 19:46, Aurelien Jarno wrote:
>>>>> For logical vector operations (in the case of the RISC-V backend
>>>>> that
>>>>> corresponds to and_vec, or_vec and xor_vec), VECE is unused.
>>>>> However,
>>>>> tcg_target_const_match() always treat it as an element size to
>>>>> extract
>>>>> the corresponding constant element from the whole constant.
>>>>>
>>>>> This causes the following aarch64 instruction
>>>>>     bic v4.8h, #0xf0
>>>>> to be translated into the following op:
>>>>>     ...
>>>>>     and_vec v128,e8,tmp5,tmp4,v128$0xff0fff0fff0fff0f
>>>>>     ...
>>>>> which is then translated to the following RISC-V instruction:
>>>>>     vand.vi v1,v1,15
>>>>>
>>>>> Fix that by, when VECE is 0 aka MO_8, only extracting the element
>>>>> if the
>>>>> it can actually be represented as a duplicated constant.
>>>>>
>>>>> Fixes: 5a63f5998791 ("tcg/riscv: Add support for basic vector
>>>>> opcodes")
>>>>> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>>>>> ---
>>>>>    tcg/riscv64/tcg-target.c.inc | 11 +++++++++--
>>>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>>>
>>>>> Changes v1 -> v2:
>>>>> - Use dup_const() instead of open coding the constant
>>>>> duplication.
>>>>>
>>>>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-
>>>>> target.c.inc
>>>>> index 14a397117a..1262b71a62 100644
>>>>> --- a/tcg/riscv64/tcg-target.c.inc
>>>>> +++ b/tcg/riscv64/tcg-target.c.inc
>>>>> @@ -392,8 +392,15 @@ static bool tcg_target_const_match(int64_t
>>>>> val, int ct,
>>>>>            return 1;
>>>>>        }
>>>>>        if (type >= TCG_TYPE_V64) {
>>>>> -        /* Val is replicated by VECE; extract the highest
>>>>> element. */
>>>>> -        val >>= (-8 << vece) & 63;
>>>>> +        /*
>>>>> +         * For vector logical operations, VECE is unused and
>>>>> equals to 0, so
>>>>> +         * we need to check that the constant can properly be
>>>>> represented after
>>>>> +         * replication.
>>>>> +         */
>>>>> +        if ((vece != MO_8) || (val == dup_const(vece, val))) {
>>>>> +            /* Val is replicated by VECE; extract the highest
>>>>> element. */
>>>>> +            val >>= (-8 << vece) & 63;
>>>>> +        }
>>>>>        }
>>>>
>>>> This fixes the BIC case, but I don't think it is sufficient.
>>>>
>>>> I tested with qemu-aarch64 built for a riscv64 host, run under
>>>> qemu-riscv64 -cpu max, guest -cpu max,sve-default-vector-length=16.
>>>>
>>>> NEON bic v0.8h, #0xf0 // fail on master, now OK
>>>>
>>>> add z1.b; and z0.d, #0xf // FAIL
>>>> add z1.d; and z0.b, #0xf // FAIL
>>>> add z1.b; orr z0.d, #-16 // FAIL
>>>> add z1.d; eor z0.b, #0xf // FAIL
>>>
>>> This indeed doesn't work. The problem is that while the constant
>>> matching is being passed VECE = 0 (as it is unused for logical ops),
>>> the
>>> code generation is still being passed a 64-bit size. Therefore for
>>> the
>>> eor, it emits:
>>>    vsetivli                zero,2,e64,m1,ta,ma
>>>    lui                     t6,3
>>>    addiw                   t6,t6,-448
>>>    add                     t6,t6,s0
>>>    vle64.v                 v1,(t6)
>>>    vxor.vi                 v1,v1,15
>>>
>>> It would make more sense to use 16 e8 elements like in the original
>>> ARM
>>> SVE code, but it seems that info is lost at this stage.
>>>
>>>> Not accepting constants for and/or/xor_vec at all
>>>> (using C_O1_I2(v, v, v) to get them loaded into registers)
>>>> makes all five cases pass (I'm not sure we want to keep
>>>> the .vi forms):
>>>>
>>>> -- >8 --
>>>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-
>>>> target.c.inc
>>>> --- a/tcg/riscv64/tcg-target.c.inc
>>>> +++ b/tcg/riscv64/tcg-target.c.inc
>>>> @@ -2779,15 +2779,15 @@ static void tcg_out_vec_op(TCGContext *s,
>>>> TCGOpcode
>>>> opc,
>>>>       case INDEX_op_and_vec:
>>>>           set_vtype_len(s, type);
>>>> -        tcg_out_opc_vv_vi(s, OPC_VAND_VV, OPC_VAND_VI, a0, a1, a2,
>>>> c2);
>>>> +        tcg_out_opc_vv(s, OPC_VAND_VV, a0, a1, a2);
>>>>           break;
>>>>       case INDEX_op_or_vec:
>>>>           set_vtype_len(s, type);
>>>> -        tcg_out_opc_vv_vi(s, OPC_VOR_VV, OPC_VOR_VI, a0, a1, a2,
>>>> c2);
>>>> +        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a1, a2);
>>>>           break;
>>>>       case INDEX_op_xor_vec:
>>>>           set_vtype_len(s, type);
>>>> -        tcg_out_opc_vv_vi(s, OPC_VXOR_VV, OPC_VXOR_VI, a0, a1, a2,
>>>> c2);
>>>> +        tcg_out_opc_vv(s, OPC_VXOR_VV, a0, a1, a2);
>>>>           break;
>>>>       case INDEX_op_not_vec:
>>>>           set_vtype_len(s, type);
>>>> @@ -2976,15 +2976,15 @@ tcg_target_op_def(TCGOpcode op, TCGType
>>>> type,
>>>> unsigned flags)
>>>>       case INDEX_op_rotli_vec:
>>>>           return C_O1_I1(v, v);
>>>>       case INDEX_op_add_vec:
>>>> -    case INDEX_op_and_vec:
>>>> -    case INDEX_op_or_vec:
>>>> -    case INDEX_op_xor_vec:
>>>>       case INDEX_op_ssadd_vec:
>>>>       case INDEX_op_sssub_vec:
>>>>       case INDEX_op_usadd_vec:
>>>>       case INDEX_op_ussub_vec:
>>>>           return C_O1_I2(v, v, vK);
>>>>       case INDEX_op_sub_vec:
>>>>           return C_O1_I2(v, vK, v);
>>>> +    case INDEX_op_and_vec:
>>>> +    case INDEX_op_or_vec:
>>>> +    case INDEX_op_xor_vec:
>>>>       case INDEX_op_mul_vec:
>>>>       case INDEX_op_shlv_vec:
>>>>       case INDEX_op_shrv_vec:
>>>>       case INDEX_op_sarv_vec:
>>>>       case INDEX_op_rotlv_vec:
>>>>       case INDEX_op_rotrv_vec:
>>>>       case INDEX_op_smax_vec:
>>>>       case INDEX_op_smin_vec:
>>>>       case INDEX_op_umax_vec:
>>>>       case INDEX_op_umin_vec:
>>>>           return C_O1_I2(v, v, v);
>>>
>>> I believe that until TCG is able to propagate VECE even for logical
>>> ops,
>>> this is the thing to do. It generates suboptimal code, but correct
>>> one.
>>
>> Are you able to update this patch and send a v3 that include these
>> fixes, or ideally what Richard said?
> 
> https://lore.kernel.org/qemu-devel/20261028143330.6518-1- 
> philmd@oss.qualcomm.com/
> 
> I thought there would be some more review, but if there's no more 
> comment I can merge it sometime this week.

Indeed I wanted to respin updating commit descriptions per Aurelien
suggestions but got overwhelmed with SD/MMC bugs.

