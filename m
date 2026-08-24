Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08853C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 07:19:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyOxC-0007Cf-53; Mon, 24 Aug 2026 03:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOx9-0007Ap-8N
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 03:18:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOx7-0008Jd-2z
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 03:18:42 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5RBXK1937653
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 07:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=; b=l8ajLSHr5ojKLNH/
 DBIiMi7GGUZlcRd7PAiORu6B49hNLg9HSNUCajb89H7ncV0ghAFiHws54rHz7r+J
 xzlqqjl0ySz/Tr7eejw9IlU6u7BtFaCEn6YoBIcbSBe+fEefTrPL3a7US5wV9iwU
 1XYvuiDGaCri8G4IS/KL8XgZ5+ngibWFwz2LIwMj9qCpBYRcROXYCSic5U1AtQHj
 tre7VCeAn7nUbRUSVtiVjp3DKbG66gvGpaPaRZs2LG9L06zcGFXXGt9VvJSBl/dx
 b8n/ODqkZfLs90181wiPBKpegkrjqb/4n59BEJWJeUueDLMHEqlHwUXSnD1VYjok
 mTgwpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwx6r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 07:18:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c19493ac2so38201931cf.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787555918; x=1788160718; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=;
 b=GaPWkUPN+a+8c8YqRMZVySTXyUeThLI+SlOgCEWAXE8WNI5aLGkKBe+znZ8+6gjW22
 hRwsCS6z53GxAIPEdWjhe6ekTtIxQ8xQV+V++zMvq70Js+yQIS7sRS0l7Q4Cr+zKY9zI
 dYb4VCw0qJVVpru55TqUc7Jx2DB6brv9CoN4SOCuuw1Xr/DtsPBdk2B9PrdA+YBdVZlz
 WMxShMidU5nHS0bEGVitO2QmilzdtUE+KuuYGoO3g7kSEpceyEG52hx49al6TKia9cGA
 MJdPbIcgbyqSkmLtvYiLyjZ7nKl1UUOtfG8grfhnqpcFbmF9UnxM2Dc/Xt6CdZ2/Jg2h
 SsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787555918; x=1788160718;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=;
 b=N7kN/HKowjzpMfLxKtNva2aITeaxOoWtr7Z+C+YNxAscBCVoof2rj4MdqpWCbNbfjT
 exJQ49vCRbFVx+18aYIUOh4qtNV6+PWPoyVqJJXNyt5XTDrFKQfW/jlEqAmXS4skBX5d
 6ZhXXYhv+U2HVxyG8PWi8Mg8G4LyJRjYe4C22NZowdieFu+INOJAkRjGdl6YK+wcbHiN
 Fh4uJIZrb/BcJ8LO9/4XYjgZQXAJp4Vsoqn0EQ0em3PhivQtKENMpFpV8niHuk0mfsKs
 qswLZZ+1S16YCqVS3WGF0x4BkELBE5ipAUpwG493GZ2Tl91u1WlZ34rcsWSKgSwv18wD
 BsiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RokdteWnzSt0aLZjE/ZRc2zmmwJqmJfMylRmvZ5nefDLvRYM/AAxq1g1MqptNYHtSyI/g0y0OjCp2Mj@nongnu.org
X-Gm-Message-State: AFuF++nKvsO7LIBcIzMDm25pPauJW8TZontyvDlqC5jZsqq1iFbmajlV
 +T13w0V+7M8W5obnHSI0Wy9qIVOz1wHvUjveY1pJ710rcOcEgZMu1G291djJ3UlHDQsVg+VZ2/g
 DE3xOPn+MNg2afdV+P1cUCQbJmLtVWvpCXMtLcjaKG7Fa+ZoQ1C4ly8ygdQ==
X-Gm-Gg: AR+sD13DZ6zZkuDBZ7WnNibq8QMxNvC+9tMO8sMWU7zJV2z2SKTCt7PVxGCNOQYzQ9r
 KamdIDpQQum+K7kfPX/mFH+fCe4p8MdDwaGT8YtBVI+w7pHLzXCl4Hp0js7Ti2nAlif+fLf2t/T
 3lHyk4uacbIb5gCtMr5J9UFOZqf52vqSyZASa61yVk8WvOExx+s0nzoSJlaLSz/d4WTQ67UpOXX
 48wJZXmbhG3pZSTjqVV+DnQFyVWdMyXRapDJ2irRFY1FEsgbs53Cko32btns/YeNgseOoikJIAP
 ST7amdISxGONNlATc8xJiEEioS8YlRuA5wm76R6+BfMY1Qgsyz87GqVo44r/YckxMa6oxJjIb0d
 AjHQ11lnlTj58ThIZRJGxI7PNNHoQOvOgezYXsB5EOVs3
X-Received: by 2002:a05:622a:1b28:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52df56f7dfamr259021481cf.5.1787555918328; 
 Mon, 24 Aug 2026 00:18:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1b28:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52df56f7dfamr259020921cf.5.1787555917965; 
 Mon, 24 Aug 2026 00:18:37 -0700 (PDT)
Received: from [10.254.188.74] (132.170.88.92.rev.sfr.net. [92.88.170.132])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f64f6sm1164436466b.40.2026.08.24.00.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 00:18:37 -0700 (PDT)
Message-ID: <63e1e0d7-aad9-4b75-b71b-b233811dc94d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] hw/arm/virt: prefix ACPI helpers with arm_virt_
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfX4M2MJERc6fKS
 MSuii6IzKyD3bTQlxioQpVAtXU8cdjbTs7T+qd1nn2e/YnocRjgR37xj2wj0/h1eCQq18vtsyys
 hZtJwoWNnSnE9mJ+px4HlwsQ48a1oqxbpphx3DdHxfkgv3syv/rcmSMHCTKaNMWfw2WrH2EThjP
 ob0hwrxC5Ri3pRfRdx5WHuwo+jT3NA4zEICYmLWF1ds5o9R7lYuXLZ1fkDiZVEda7yaG56YP1Ev
 YrPGquoNTjI4gievhSWsC0cd/z1NRJtNQt2DiGc2M2c7ybyDpxdgEm3Ad8Ia6my7TeuQAfseQcN
 gM3+3Mvk00PzDNK2/3wfznG/Jo2weyNGnnZoAwSneFvjwR29irITkDNVGSDVHJXpba64ph6lxbc
 33wLlK26pKnXntryrBQWoP6bMkCgzJMGAN93o6bTzxKjq9VxJnv6B3ZU7+ifPnEUQHNZ92AL+TD
 Em6MrUrGKb2WX04FxAg==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf04e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=k3i2zbviP8V9/5wfVjyM+Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NjuWi_0k4RBEpBih90-fQ3wc1PCkQd0w
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfXxEMWRPh4t+tL
 fchU/+r8Oo0FQjAVLLtYZaQNDmh22sE5P/HxiUoEGPgKyNXbvuAS0uBpSkzy7ZyfB6efSeiMcQj
 Bx+Ckv/qXg7F4rbO4eA2neJzFZ1Ocrc=
X-Proofpoint-GUID: NjuWi_0k4RBEpBih90-fQ3wc1PCkQd0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240063
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 23/8/26 17:07, Yonggang Luo wrote:
> - virt_acpi_setup and virt_is_acpi_enabled are generic names also used
>    by RISC-V and LoongArch virt. A combined binary cannot export two
>    functions with the same C symbol.
> - Rename the ARM helpers to arm_virt_acpi_setup and
>    arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
>    unchanged; it is a separate identifier.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/arm/virt.c            | 12 ++++++------
>   include/hw/arm/virt.h    |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

