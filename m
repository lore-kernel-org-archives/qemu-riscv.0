Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E785D606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fql30wke;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUhHzU2O
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQXYk-0005CW-3k; Mon, 09 Nov 2026 17:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQXYa-0005BY-U2
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 17:09:42 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQXYY-0001QI-1U
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 17:09:40 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9LAJrm1062280
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 22:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0N6txGuoCy050LjwKuyYPj6KbLN4zM7FrAU+ARIjgnk=; b=fql30wkeierMAq2O
 0FsTKZM5VG+/aT+DdZVn31gU5LVQ4FlHTcdJID+85gTByyTt1MaX5wdXLzFttyMo
 jt21hhBRNskDUth/QBPvk221lyCdIucD7JV2AE08a5yztzvnIljOQUIa2Fv7CEza
 P6eGjxnkXMkmGJoyZuT6Kji2OxKJEpizKyfSEnhE2A/Ho5YATXzPBkECJZZHQl1w
 8pVrsszVBPmSCOqr1LnP9zEjIguqucGogTdTcXiuwbSpLEPV00x242ltqKag7ORQ
 tI6pA8eQowfln7w24uEmnkg6YJj/WztQsofkMip9OcbtcrI/FLGb2ezTyP/9FiY/
 Tlf2Rg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjcga-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 22:09:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-980b637ed69so305878241.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794262175; x=1794866975; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0N6txGuoCy050LjwKuyYPj6KbLN4zM7FrAU+ARIjgnk=;
 b=NUhHzU2OU0ka9dyy26a84m6Vn2mnaRBmvNxrzT6tzcLgrvrWPCRTxmG6BO+y0o2JN5
 L6gl2vmfvgbHOFUkmUjMR2XlnrsMjGvUhizigmZu1L3+a80/t7YPIfUpdhrh4a7ANajj
 adM9EixLB6xj7pdRcBHc4eMG+W6Cn6DjnMGRsReFMDtX8fLb+7+KrWZU8T+MkNTF/leM
 xangyMF309FpmhosmJcu5o7XklCVlwgfxQhYkjE4To+GEL/uwo3zZxO1tiyJMcDrUuTU
 C/I44MFXMIVUgggMTmKhj48i6jkH0VG6Y+0KCJ4+WuJqjBe7MXPiiKAw3jQU34xbLfen
 eI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794262175; x=1794866975;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0N6txGuoCy050LjwKuyYPj6KbLN4zM7FrAU+ARIjgnk=;
 b=MUyEKizmWp1BcfpIhXTzf2/7fZaMxUimssEUdEeKLToQHE589hSE2cu2YY46w7d6MA
 KLSA9QCK4VrjzirDeNk5B4x6kf/xst2ENiIPAEiY/hIjtXVQG6D0s23pzhWfKlMNUSG5
 ill4bAOlWq0oOeD+oUTPi2vJCDvcbVYzWlfDWwNDIwFyXH9cVM4PiSEjbtV7CCt/Waiw
 xBgV8pMqE/3csgIHaHJa0uUqgckTfE9vPwdrGY3HmLP7DUqD3ZmpEIVPuCBXIWFhJz07
 +39TbFenQdl6v7zHNTrHu8BRwAu7kCCKZmJpuCs0bpKIG0YzeklLMfuHKzDkY52042ck
 rluA==
X-Forwarded-Encrypted: i=1;
 AL+hErGqTeoautjywCI6ytmYuOCpW1UyV4cx8cqD6LlgiYiuq+GKoS8VNMbuABBBlj+TC+RDoPJeVqTM1hJQ@nongnu.org
X-Gm-Message-State: APuU4Z8jJaiL21rzGVbssM3Sc/pCjG6/VlW4bzYc5G+2rCsvh8m8/98L
 8ZaqOzE23OcJ03As9d4XaSm8PemQpxWCBRCxZxXjCGtR/e6IvL/sgU/goPSGRQSzdI9DFlHatJP
 cDCQofp5Eadj+93pUWAObaNb+ultNap8zlA4ML4Uhb9FBFZm3XAs9NZ1HlQ==
X-Gm-Gg: AYBFou0g+A1eUZXCrN1f/LkcJ0cxipRBR0L3dTfRLxXG3f1E4a+sltF6LgRVdZkr927
 tzpstlX6tew9YVMnK1HFrTaheTwVgx32HbGtKp9zq7UhTH+/RYfRk8YRAWE5UiIEhpQCZ4glVam
 A59ZLVUbEmxHuV9pXg+aB3zz7Fm8QLKeV+0fHQACd8OwdfL78PQklzjRiZJzWlAzlPFj8/fi4xg
 ULfk52yqnHYYv5a0Vq316pYjeh9oAMPlV3yijT/+B2CpmpEUCoO67l6m+Gl429GMrKNKrl7NKew
 oHq/77PRzNSCymlYuwEcoY8OcJbhG3mESiJPA17N/IxPAe4Eov13ZXlUSd4uecxwNmNVhHZ7S5q
 tyFY2zN7dvvs0bZx0R53XfZuoBTEjo3XMM2RNhRrsRutXnJUCdVnlTaHqx9tQEbVcZeNIJGQ6M+
 qDBBq0JA==
X-Received: by 2002:a05:6102:3f8f:b0:7a8:2a34:432e with SMTP id
 ada2fe7eead31-7d301b8d8a1mr245861137.9.1794262174992; 
 Mon, 09 Nov 2026 14:09:34 -0800 (PST)
X-Received: by 2002:a05:6102:3f8f:b0:7a8:2a34:432e with SMTP id
 ada2fe7eead31-7d301b8d8a1mr245849137.9.1794262174497; 
 Mon, 09 Nov 2026 14:09:34 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0233f95dsm9597055e9.1.2026.11.09.14.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 14:09:32 -0800 (PST)
Message-ID: <c43c435f-66b7-4a93-9b01-19ed22920869@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 23:09:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Use gen_goto_tb() for vsetivli exits
Content-Language: en-US
To: WX Chen <wxchen0913@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261104-research-vsetivli-direct-chain-20261103-v1-1-ace12cf5280a@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261104-research-vsetivli-direct-chain-20261103-v1-1-ace12cf5280a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX1yMZu9yNxBBI
 lPEB/2wTWALIAeBpI6JGMBopeo/dmXpjV41BoF+Zzju2YSX7BhpaM9DsrXbaytH8zEhRTDLjoVG
 ifrvq2FIHWEfA7hO5Vd+HmnHWDeTQ9k=
X-Proofpoint-GUID: kO_u60fPCJUeIMd40ahspW7LCyPrebGw
X-Proofpoint-ORIG-GUID: kO_u60fPCJUeIMd40ahspW7LCyPrebGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX3qPoHVFULlEr
 L9Y5r3kk9Y2Au2AqSjaX1MTT3G1TRC0hK2vDni8/RbbGxtXJWUVfJ8kF5+brvNZdfXYOAPRhRd+
 /fxqwU3JB1/fMLeulQeZikgsDSry3ZeyeTZwbkWrU367/tKp6GwRCgue0E3zdm6pCnHWS4nkCq0
 5+SrJ5Vd35JFBf+5uX0+2dssMj1u3P+fL2wnmphAmvgN9tad2yiOb2IpxdoghxXv3kRAALt/LBj
 KMFkiduoqXG5JH2GG7fqhD5/9h9RVYrKx1HlLUtOZDjWDARYd1tktf/m58CnnBOHWf4/TJ6MCqw
 nHd0zCNvMylREdjNC3iO00oyummmfUn2nvZyB/rZ5dp4Y31Bd/DDaExTVa+uVC+yJ2kuv06hwUM
 z/9hNMi5LFcFHs5WGhG9gAq3B/ioIf23JOsyIPOBMYAGelGXsdw+BcfafKyYum6SK+lXJsN9d37
 vDOab3yJxlQ6t0I1fdQ==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2449f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jJNwmlt5YcoxQ9T_qy4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090088
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

On 3/11/26 18:34, WX Chen wrote:
> This change adjusts the translation exit of `vsetivli`. While preserving
> the existing helper, state update flow, and TB boundaries, it uses the
> generic `gen_goto_tb()` path to reduce the overhead of repeated successor-TB
> lookups.
> 
> `vsetivli` is used to set the vector length and type, and both its AVL and
> vtype encodings are provided by immediates. Given the CPU configuration and
> the source TB execution context, after this instruction completes normally,
> the vector state changes relevant to subsequent translation are
> deterministic. Therefore, this exit is eligible for direct TB linking.
> 
> Measured on an AMD Ryzen AI 9 H 365 (x86-64) host, using qemu-riscv64
> with -cpu rv64,v=true,vlen=128,elen=64. A RISC-V GCC 14.2.0 cc1 built for
> rv64gcv compiles the packages with -O2 -g0 -march=rv64gcv -mabi=lp64d.
> Only cc1 runs under emulation; make, the compiler driver, assembler and
> linker run on the host.
> 
> Each variant is warmed up once, followed by three paired clean builds in
> AB/BA/AB order, using -j1 and fixed host CPU affinity (CPU 7). Median build
> wall times are:
> 
>                    Before (s)    After (s)    Wall time reduction
>    LZ4 1.10.0         125.017      123.060                  1.57%
>    zlib 1.3.1          71.062       70.310                  1.06%
> 
> In a separate untimed test, a loop executes two vsetivli instructions per
> iteration for 37 iterations. Host-side GDB entry breakpoints show that
> helper_lookup_tb_ptr() entries at the two successor PCs fall from 74 to 0.
> The guest still executes 74 vsetivli instructions. Initial TB dispatch and
> link establishment still occur through the normal dispatcher.
> 
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---
>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

