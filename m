Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E0ACD98E1
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 12:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZSyr-0003yr-UG; Tue, 16 Jun 2026 08:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZSyp-0003yG-Py
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 08:33:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZSyn-0006kG-SE
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 08:33:23 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GAC14p3256226
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 12:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JNPwdZdRGwZTDYLl1vNTJIM6pmta/ZiyQeeK7vgPny8=; b=laFWwA3GesC+XMgQ
 pioTggXhRE7Hng8giHuLcP+mQbmc4jQGikGTpWKTRuiP8CIEiWGdXBl7DNDjrIZO
 8CG8IQRC5cRJY6YetLh4Kixn+yU+ZHrp/oFhxhvbpgSIKGoR1JtcOBrEMcbTUg0D
 VRJIHiGWasgsCaYjbWSNjGfSWAcAsuvCn2mjhvQy44JIWCrS6GA41g5r1VzecHr9
 m0ZAuwRRj6ISnL5TDbUzNuwyCUUBPZtvTha2Le7qtb+fp1hXaCV8xLCzKHpJJrrd
 LwosSvSmdff/sEPkRoj4yu0QRO1T4OfhNR+PdBTfu6aggBP+m51twF8fNIhF8Fjo
 f0xkYQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k9qsq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 12:33:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-307fd7138b1so6665480eec.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781613198; x=1782217998; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JNPwdZdRGwZTDYLl1vNTJIM6pmta/ZiyQeeK7vgPny8=;
 b=Alp98Nodrym+9iGkz/WaFjYxbxOJmGGEtxyQVoXlKm5DMd0ZMKoAyB8L97a2PTcB0E
 KIRR4zQDGKhfncy+gFf4QUouWKOWP5GoKgeeEI15gRvR+eQ+jHicICXdqWr9eB+VtZAI
 PT0Cmw8jZdwBXVM2Bofz92iDA08cDZTXEiuQA7Sv6xSIGiYVh+Ig9FenGXA/D9xwl1Q9
 nWK/S3K0tGQbhb7pg9GK9UVJKeQXjnQKinKQvyzaZNPqLe4sILBKaonkYtyT8t5KBGy2
 j6SyWNiCPm0byzFBmMd88QYB3bY6Hvtz93cPryH8SG7gmOe8yBfOJEfBm+Fss+ZSjY4I
 gkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781613198; x=1782217998;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JNPwdZdRGwZTDYLl1vNTJIM6pmta/ZiyQeeK7vgPny8=;
 b=cXU+8DiXHtCs4tIl4fCJpdoeiNAgQ4TLOqAxM/xMNuGetwK3JecN8yk4n+I8hpUGlf
 yGPt16DmPCSlYFzNbCL6/i2khtBnTC4Zph43/AwZbjPU8+I4TF5XShkIQY6SD6Gl7oAC
 ib9MNgVxEPkI0cbi6cuzAutH/MwElNJ8W7hdcuMu1N+VZiX48d62FJIssCGLpdV3TATQ
 1neqaLOdwiFn5l8dmb0Pzm4azd4GB6L7yKca6CnqJCr63klfsag0g76+tMT31oHw/vbO
 dhiQYn08dbTaQgTxicoYU+oROOXq/N1YMr1Xl5cE6ERpeWnmk39tZuvQVPPsCrs6uYUq
 5t5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ux0GAeNgH/ug/NShqbcFd7PAU7popttdrIs1CB/j33MmVnmY9WMiRWNYTS6mrkHAzHT6ubIO/ZxZm@nongnu.org
X-Gm-Message-State: AOJu0YzLnqAOpDUu+YSKzT6qFs5mrOYG9GPeqF6rySPwM34atM2Db/Fq
 07PSeGWsBIRieefygG8FyURGGxr98nyIqV44OG4PoE0BvffjbQfnRSLdi9wTLsFEjgl858/f7wu
 ofST3X/XXdAC32H89D376XZdViwfQ6wZgEIQbbsMVmJGQOmL/pDPBj5Kc23widzTXKQ==
X-Gm-Gg: Acq92OGzYPu327ZIWdWdSbeXLKpuWQdvzuJJBm5ZzlgQfV+EEitPxJ9QlsUScLB/Xew
 D9ozcTC1h+JC+Fk5i9pkCgjoNZpGj+nEEM75+D8PksWbdFoGt+aZxF3h8f5DuvrcUeHiJbT2quZ
 1XdlHGjJBB5nNFJpgFF73ssVytBAoenLZchrwXIaMu8mQeWHW+MFIUwqA9oiw15Q+/pDabjo7w7
 MRZ7nk9tqISNJgZPfBtclTXUAhe1HiIsMpaWrTLqUtTOEW4VU9ImQlcynZ2HPCmDmCuBMpgj8y9
 eI4vcTLxvNYYkCmzQL2dgZmS6YZESUvy5TADX0VsESJUhl9yx1WxGEgFsRPcezHfWWp+VG5dteL
 4pTf8n4Q/GLZ/qkQkyKvWE1cGTIZ6xb+H+XWQKdO9qSzWqDdeJfTxA5jc4Q==
X-Received: by 2002:a05:7300:231f:b0:2da:2ec2:64e5 with SMTP id
 5a478bee46e88-3093bf0852bmr8942410eec.18.1781613198274; 
 Tue, 16 Jun 2026 05:33:18 -0700 (PDT)
X-Received: by 2002:a05:7300:231f:b0:2da:2ec2:64e5 with SMTP id
 5a478bee46e88-3093bf0852bmr8942381eec.18.1781613197537; 
 Tue, 16 Jun 2026 05:33:17 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3081e48e412sm20318314eec.4.2026.06.16.05.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 05:33:17 -0700 (PDT)
Message-ID: <66d9c9a3-f3f0-480a-96bd-8e237c47c732@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 09:33:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V Code Policy
To: Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org
References: <057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX8+UhvADk8b6X
 c91q2c0ZxUwP6RpMKppIFOdAZLA36ppy4ET+Td7/7KoJNpMpxRybvwqqJR3P8K7jB5bdAF7Y+/s
 pDMHWSZ+pvC4zpzViYKujWvkKhHy1y8=
X-Proofpoint-GUID: VtcXXkrD_3mC7VQrvARuv0nesAnSKmMx
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31428f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ID6ng7r3AAAA:8 a=63Zwc7Abw1uGc_hMOsIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-ORIG-GUID: VtcXXkrD_3mC7VQrvARuv0nesAnSKmMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX1mYw8vKWbKYT
 j05CvrioeO/AsK8hyP9cx7L8H2jICluW4jW+W1eaLQIpyfRJ8GJ9bLmWFbiCe4QKf3tQnsnTpnr
 3fO/+jbOnxr1l4Uj/ry/69bkKcwbTaMCnQ5anfmEdL8b4WwuYNu1TxXxGbvYKkNNJIOVAYaiE5R
 sg/4x3HqQ5hnS4bWNu8/zq8SJSTLZBQTxA49MdMlrc/KuvGoci5Qkn0T1BSvd6nxIwkfPGiXd5M
 Tdy2EdDbDjHwiNB33cN1+uty/8N6HPUC0QQPwj8JNS/BJVugEmNWE6JX5ARMBqzYUSWi6JigeJQ
 yZhY1sNb6lsyyK14hgTHs53/7IE0HoVrik5732ExxllLnnrZau9dMClvJCPEqcFEbw7Deabf7T1
 141EP8JlTHDpuSjGeLrP4S1RJz5gD5a6VNwXunD6m/H78jBzxAXX8SxX4EcGxe654h+c1U4Z5yR
 Wc0itbOXaTBIywd4CIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160127
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



On 6/11/2026 9:37 AM, Alistair Francis wrote:
> Hey,
> 
> The current state of QEMU RISC-V is very swamped. It's mostly only me reviewing patches (Daniel does review a lot as well) and I don't have time to get to everything.
> 
> So I wanted to propose some stricter requirements on upstreaming features. The idea being that we can improve the quality which should reduce review burden and also help filter out some stuff that maybe doesn't need to go upstream.
> 
> The idea would be to extend our https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Foundation_Extensions section to be the following.
> 
> """
> As RISC-V has a huge range of possible extensions, QEMU has guidelines for supporting them all.
> 
> If an extension is frozen or ratified by the RISC-V foundation, it can be upstreamed to QEMU. Generally we will try to support as many versions as feasible, following the usual QEMU deprecation policy to remove old versions. We take efforts not to remove ratified extensions.
> 
> As there are so many extensions and so few reviewers for QEMU RISC-V we do have some extra requirements at the moment. All new extensions much include unit tests. This will require testing the new instructions and/or CSR accesses, most likely by adding test cases to `tests/tcg/`. We also require all new extensions to have a justification of why they should be added. This helps reviewers allocate time. Examples of reasons would be: "my hardware xxx is shipping with this extension", "it is 
> required for xxx profile", "it enables this cool and useful feature". Being an official RISC-V extension is not enough of a justification at this time.

I believe most of the features being contributed fall in the "this is a
cool and useful feature" in the end, so hopefully we don't need to ask
people about 'what hardware are you trying to support' ... sometimes we'll
contribute stuff that is related to HW that can't be disclosed ATM, but if
the feature is useful for everyone that shouldn't be a blocker.

To be honest I wouldn't mention "my hardware xxx is shipping with this new
extension" in the doc.  If the code is good and it's a useful feature and
has test cases I believe that's enough.  This wording can be intimidating
and scare away what would be legitimate contributions otherwise.


> 
> If an official RISC-V foundation extension is in a reasonable draft state, that is not too many changes are still expected, it can be supported experimentally by QEMU. Experimental support means it must be disabled by default and marked with a "x-" in the user facing CPU/board properties. Draft extensions must also include unit tests and a justification of why we should support it.
> 
> Note that official RISC-V foundation drafts must be hosted by RVI and the code must be developed against the latest tag. The QEMU series must point to the exact spec used for the extension
> 
> Draft extensions should also try to include the version information in the property. Draft extensions can be enabled by specific CPUs or boards if the hardware supports that extension.
> 
> QEMU will only support the latest version of patches submitted for a draft extension. A draft extension can also be removed at any time and does not follow QEMU's deprecation policy.
> """
> 
> I'm also thinking about extending https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Machines
> 
> """
> As RISC-V Machines are user facing they follow QEMU's deprecation policy. Backwards incompatible changes should be avoided, but that is somewhat board dependent. For example soft core boards (like OpenTitan) are in flux and likely to change while the `virt` board is fixed to allow developers to target a stable machine.
> 
> Adding new features to boards is acceptable as that doesn't break existing users.
> 
> When new features are added there should be a justification as to why we want this feature.
> 
> Where possible boards based on physical hardware should model the hardware as closely as possible. Information (ideally a datasheet) should also be provided to provide technical details about the hardware.
> 
> Machines that aren't maintained and/or used will be deprecated. Submitters are expected to help maintain the machine after it has been accepted.
> 
> All new boards must include a boot test to boot a guest on the board. Generally if the board supports Linux then the boot test should boot Linux on the board.
> """

Agree with everything else here

> 
> Any thoughts or comments on these?

Reviews are a problem everywhere, not just qemu-riscv, so we can take solace
in that I guess.


Cheers,
Daniel

> 
> Alistair
> 
> 


