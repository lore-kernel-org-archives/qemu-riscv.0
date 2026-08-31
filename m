Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6755C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uLs-0000xj-Ao; Mon, 31 Aug 2026 01:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uLo-0000x4-Hs
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:14:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uLn-0007JV-3g
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:14:32 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52TlA2679961
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ky+Oubql6ay0BSBRazstaXhDAnOUgQreUl1P7QOt+Kc=; b=eb9qZ1fN1ORahnri
 4tK2OMRalZXXjQRsThY2YJfNTjIOJMBtdFocDoh9GEGUgQIjqUpssLAWIdjBOm0V
 1/P+MMg9bKa0uhoPAx35Uz8FBrqU+CTWfAJQV6hOP2uxbyerw2rQnToo71A+8/d6
 08QDzXKWHw0Hqx1DWCE9OuHceNd5RXLjcMd2QkH96YSxhj6D/suoKfOI2H4LqVb7
 tqyv2LngqjK/6iAtUnSNa0nTkbaWtd0Hn6i/6w58Thktf6QaBIaPtLDPu0QGq4QS
 TRwrlIfKx53zUUgJEFiPMQqythOBm4Qz5rGfQhR+c+RZUt4GOqqT2CZ2axCkpKK8
 11ckYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwcp5j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:14:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e538afe65so738720685a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788153269; x=1788758069; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ky+Oubql6ay0BSBRazstaXhDAnOUgQreUl1P7QOt+Kc=;
 b=e/iVKvXs56IbqDPZszBErfcYPtyJ4345HBIzUtah1pg3Z50eG5WxsMZ3vL5aRUyGsm
 0gxTaR/GZfumglizZyoR6/lnQLNqiIKyaP8KoorujUMTmLwUCLriUraOeldAE3S3C29w
 oqyuvDScv9RzBvUmtJKyAo0X7Gda+FgozLffL7pybJQxtQ+VOMNxJcxOkOHyacyyQ6nT
 1H1HK4K/w/0RTqiERDDJZXaLn1Mo8qIa2kIk5K/mo/6U9IFyQmmxjIbq5+VDBUz6rasp
 CzNC07rMa1PmUYittMKORocsfDE3pNUIzGPRG/1ndohRixf8LL1bf59ux7mIrskNVLIq
 ovhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788153269; x=1788758069;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ky+Oubql6ay0BSBRazstaXhDAnOUgQreUl1P7QOt+Kc=;
 b=L2Qwc9A2ztNrH9aIrTzD/1n1vbONrNkj1FyATRWA9QfNQj9pCnUL33UxEZk0t+jhvK
 nMUUifgqRiJRyuneRhFHu7CoW+40zk+GI+va8NzX0xyyW/Lf+AKM9y2U94/eUzpNExzs
 I7odzM+SCZc2Zp8F8HZ5DdR9C7oET27wZBQ14byzo/coiI2mRlSpdozQCuiVOneE01bq
 /7vuoO0RmbS2/kPVOBcn6W0zEmPA6xFdOWwCwHP89QFy2KVTUSLwcL1wkCxv7nYl2MLR
 Kq+OxVnke96eMzID7L6yPpZI8wELlNjSBw4lQ5UqL0XhhbcJxYfKIJRSGdSGKxrTAuL+
 oyGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RogX3Vs4qgPkI9qU9hHRKFdtPluEb00k3mvBrk49RY3JERb9+YZZexh7sNDq/RpCBbMAwczMjJpBky6@nongnu.org
X-Gm-Message-State: AFuF++nFWgHvIn8m/48ovzc+biJ7cKI6NAaH7LF3Vnr8i8H7gVWCrZEP
 bhIngfsX4vV9vd0hIV1zVrq7TChQgTxlx9yAJfxieoUJDj3du6q4T8Uey+qdGtAyp7BFyzwyOhl
 gCnb1n8jwyLaubSfW3iz4s0Sg1Uq4P27dURoC2hKCiSHW7gk49fyHJxXSIw==
X-Gm-Gg: AR+sD135N1x3bvyCVulB7nGhu+rFLXF2KFdv8V+DGAt8EfNfawyOShHHw0nAf3mVbpn
 Bpey2lf5sLBlUM0ORHZb7mVEyZ21ulel56gJOuvz9PwDiWLENktq/znOZ0zPGKerauDZmu2URFi
 12G8pKe4L+WE4OjgdlT4Hp6waJxhdUCTukONhIg7kAoHBC0afr2EoYtP0DIyQQv8epxvBQz6/y3
 EJTZ68cKoSWR/1/Oj55kf001QzcRM93SkQWHDTfvwKI9VdC0DHw0b6rEsFTzGE4LOVuT9sqne64
 OUPdmjPwjOrcrkBvAP40+xNsU2qqRyuueLP3RAOuuEWuJVaZFX485ytfqPoqSdem1O9kWqbwwRK
 zn67l9srIkkEFSXDwOMLk4aSEvI9vnqWdiA==
X-Received: by 2002:a05:620a:1a1a:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-93942855b42mr64572885a.15.1788153269049; 
 Sun, 30 Aug 2026 22:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-93942855b42mr64569485a.15.1788153268616; 
 Sun, 30 Aug 2026 22:14:28 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9500c80asm299372585e9.9.2026.08.30.22.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:14:27 -0700 (PDT)
Message-ID: <ba4efe3c-015d-432b-b799-b36402101103@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] hw/riscv/atlantis: Rework device tree creation
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-11-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-11-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GOU8akxWpL_J6pccFf8shqhEcRaWJMpI
X-Proofpoint-ORIG-GUID: GOU8akxWpL_J6pccFf8shqhEcRaWJMpI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX0NTF89tRpOey
 ZEbWGY8NUQMcNGOUWHPCo+vVWG1DHu4LlDVI829ttp/J3pmwkAqNfsuYDd8rf54aArydWj8ANNe
 EoS2lS9xTMMUMCR4lOT238EVcl5PFQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX6wqJji+9mInQ
 53KwTiO0gqtwb0Vo+d+CQrND/E+VfwtXS4uXtbGfGicC3SZ8ppa4/JFZWMucwI+IvZBO/WJTfI9
 8SSUnZQCrMRg7DiYbT/CORPwAYf9kRCADvwwaorqlhUmdUH3jjVq3e5TE2SZ18yo1Etf5KPSHAE
 kL5D7KS1v3n14OzQP9gS4iSxuN5jef5vcFoGGPYaizuRR+nZc7RjgODk+b5QjifeRiMZV39gzEq
 MUVHzkJVbzONankJx0Z23TAVrWjTVbX1TgZfwYucLWdiEOA2bgtjfD9Db6675Xds6nVBu6LvZmm
 N30FOkKMH6k/h1UAtIM6QPZBaxUHZ/dDaNbCIIa9ob3iUwo7VhHDkQZHwSZepavZ88LJOS6g0Sa
 jfGPDxoPLvA7ysMUE5C2nGvK29whp7nEcPXk+5HbtskdEmFzwnpE9zlcZ2IrOh5DrXcLr5Kw13i
 CUhGPSuKpa+DD/FV4wg==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a950db5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MixTh2NVsqCyUEpE3OoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310042
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 31/8/26 04:14, Joel Stanley wrote:
> Remove the direct use of MachineState from the device tree creation to
> allow separation between the SoC (TTAtlantisState) and the QEMU
> MachineState.
> 
> Fix this for the device tree pointer by passing it directly to the
> functions that use it, instead of casting the TTAtlantisState to a
> MachineState.
> 
> MachineState::smp.cpus is replaced with TTAtlantisState::cpus.num_harts,
> as these are equivalent after tt_atlantis_machine_init.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/riscv/tt_atlantis.c | 51 +++++++++++++++++++-----------------------
>   1 file changed, 23 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

