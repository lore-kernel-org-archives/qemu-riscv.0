Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428EECD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:31:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgS2-0008Nk-Vj; Thu, 28 May 2026 15:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgS1-0008NE-4r
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:31:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgRz-0003LK-IT
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:31:28 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SIOS3K1064637
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t1Jk81f+fiJoa3nnTexbHQVufOfsFrYedpgweaur4ec=; b=a6CZ+GfjzSSDasAq
 EwqSArT5OyymClaRagStid9lDInnHp9cF9gK49vL2BbqMUHK+yDOTFeIeoNCcw5s
 zrQdU2+MCwHqwMl+69z+dfx600yeX9NqElAH0vDvIHtFzPuK1PDcnXRqBE1J2ybV
 fXxoYVT4KOjsrCR/VDB9E8midyYIkvs6iOqHzyr9mITR8h3V2ayYDP5brnTYdq2Z
 syhx+C10Y9j+xFN9hH07MLqyGKhytE6pvyNOwVYMuOFD4U04H/qW+B6tpQG2RTjh
 MeK4uZc4mFIATgpMgauafkyjAjXo8pKTScL4Q3ZatYbX8n3iaeOi6nTRWTUfnd4T
 Sz7VVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5r96w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:31:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304e3e3fba5so1442809eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779996685; x=1780601485; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t1Jk81f+fiJoa3nnTexbHQVufOfsFrYedpgweaur4ec=;
 b=EVSVxCRAu2CpReKypKCZg8zjQL7t/a/TzgZcaLkIRaaQxHUcp/dhM6hqi+DR+8XBMC
 mvJHSzhsO7jU6IayZu5lmCIsCWV763FWy+qMkDTxvrxuIk30lw+X8Q9UA5D2x7glpopO
 8Bg4qg0P9aAk95cpcWpcJZAi3OLcBb0+nBu+HI7l4z5S9wldgAJL3GcFYrpC20zLflWC
 +bT8df9I3ocq6ioNCcW/2OUXZNTIr1EcJNYMhD/NX5TzDwt+9/aEKnCcbQlWtifzgX66
 fXLKGTzhVM9Y6GnmQZ2A/XCHLAoJvqLV+BuZBu2ybxNPkRXfw8Vta3T+aFifJdbCG3zr
 vsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779996685; x=1780601485;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1Jk81f+fiJoa3nnTexbHQVufOfsFrYedpgweaur4ec=;
 b=mLeu7Rct/g1eMc2iy3hGLajweTeBcmbbVWEzwbdhO/JmN2uS8WUT0MI2qz9lpfbtlP
 PxtYnTampOx35+tJQnDu62sJhpaKxEjABmu35aye6lYPW1YeiATgpl1uKH9pz3e5OjJU
 InS3LIziZzyNzjotfnlUMrxI+27Ye2Dq7JezfTzVq3MxBWmh1mfOBgS48qi6pdx03Mlz
 dfJ8FZh7tgNs3d5MWGgFvhW/WOPN0MwaOCciQJgtlvZaa+nJSMG+L4OTYxgf5tz+xGLx
 eNbnjf8BtrzQMhTUL8eKSFlQ9p22KpRVsCdnu5bD4BWFAUn9TGyg9+eakyExkbipTjYp
 EfRA==
X-Gm-Message-State: AOJu0Yx5G5as7rhW2a7rHqrFRzYCaVq56liHPoZpnzj+mJC0q7Rw8PrT
 +AjAZ15O5Crq88jarNQn4CsMD8TDeZPeZxpqdBxDsHCh/XAsXbCtepQz7POUzuEYc0BHcBzKVXX
 i21W9uUScLFo95Ft2zo6h9Rpm+V0BO+px+D+OAy4M/oDs6sqlrc8/WtOROw==
X-Gm-Gg: Acq92OF5n84InM/QLwTBahKtzlKuHj9CK79kHKFgmtvw1XZD+9NJTLL8+Nh44szS6nj
 7IvPJPUIpu+DpjajnjMwMTphIiNs51gDR4abK7oOz3M+HVGV2JF9LirJnbtBl29pKoGPNEQJrDv
 NWUmYipqTSFSkB3bWZ+5s1JzpTTfLalpVHzuHe5joONQC63rl/558fQ02RSjkVcxfqj2wrFf7gP
 U0Ef7M2a+9RXTDErhlF72Ns6jNakK1ZNzmBuzt0ZbmfIrbf4HIXkaGlbcJBur3+5zoKb5nrWSVh
 +UN53nHug1BJNw6y5ifl/Yqk80eqAcZ6C3Msq65jH9h9iiJJj6G8/NjhzSiZBUgTwRUZ6IFseF5
 Q+dY2NMMrQqWnOVbKbH87r7t7GXaKw0SiclhZ1QJ+tcpoW1OQi90QVthJNvaJymkSIV2LEdSoJg
 Dg5BRfDQMC06mmMqM2VRXytlCb
X-Received: by 2002:a05:7300:6143:b0:304:e72a:d4d9 with SMTP id
 5a478bee46e88-304e8c38c2amr229921eec.19.1779996685334; 
 Thu, 28 May 2026 12:31:25 -0700 (PDT)
X-Received: by 2002:a05:7300:6143:b0:304:e72a:d4d9 with SMTP id
 5a478bee46e88-304e8c38c2amr229908eec.19.1779996684759; 
 Thu, 28 May 2026 12:31:24 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e98c7821sm98440eec.19.2026.05.28.12.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:31:24 -0700 (PDT)
Message-ID: <3c4177d1-398f-4710-b10b-4303f5e9232d@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:31:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/12] hw/riscv/boot: Honour data endianness
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-11-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a0DKKioNil-crBPOoIY3EVDEYYekt9jI
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a18980e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ALku5c8DAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4ggAUwVCEv-4EGQgTU4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a0DKKioNil-crBPOoIY3EVDEYYekt9jI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NiBTYWx0ZWRfX93WNGMNsoTF4
 HLMrc24fOlAkuohbQ+MujGjgsl+ykHt21tHMqRlBQIGPmiB8W1V4SUDFEiSllrEPDdcEm7f/T/Q
 WgBUbNzgns2rlWnwSZb5iL4To8bDm2JrbiRfxpjL+mCCaljqKhMZo6vlqXQpTt3boQJY6bRE9Cr
 MnhfHOFMvPDS3NlHEOmB0IXkxxklZZexABJEzCid4oaccTAHdwxco4qbT2WtujD1H9D2XPXT6Gz
 EwamPnW6CQmlfayJchsp3fiwi65CKpOkJJaAb/9Sz7LAoj/26CJuW1uhPZbnI8BmBLDFjeNOzCy
 XinoCF0gBs+lD/kQbEVQP2am3hf6BDcassS7VgKbvRnn3bpiuTI/feck/MqWDWqyh6zw+7LaFrP
 I2oL7lyZjPhYF0NdTXjzwAAjsjhqFsoTCGkNJcDPl9Ix2DjQfZAbEsg5O+jTf/AB/7+0LC/gScI
 T5o4XHjS9E04GciuZNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280196
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
> 
> Check the hart endianness property and use it throughout the boot code:
> 
> - ELF loading: pass ELFDATA2MSB or ELFDATA2LSB based on endianness
> - Firmware dynamic info
> - Reset vector: instructions (entries 0-5) remain always little-endian,
>   data words (entries 6-9) use target data endianness.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Co-developed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/riscv/boot.c | 40 ++++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

