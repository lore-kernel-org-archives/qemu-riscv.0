Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11040C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:36:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wjC9G-0002Af-Kh; Mon, 13 Jul 2026 04:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9E-00028j-Kp
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:36:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9D-0002gr-3b
 for qemu-riscv@nongnu.org; Mon, 13 Jul 2026 04:36:20 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6NwUr472822
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=; b=bm2Kaqc9kbMlyJT/
 djxFKpS51YIapV/QYpU+L/XffhFApiR/CvDxul3qSarCKsJ0F5hueKnSCfxG87wq
 DaYayJAWciWLbm2B+oPxH/kFRGB0Vccqd9J8NjxBTr5ptAOlpwDTHjB4FMk2dsEN
 Xi+enY0x7zksg8qN9PtUHLCn1KVKmWw5woe08vN4Euw0Q3VdkC1mj9wiqf96h2sP
 GbTTL5eayx8tOyCsrSGncCqSuqu2wZaCuvCkBrHDWQ9AK/DEB+0Mkv6J9rXmAVvs
 ZL+aigqOsZ9uh5RVY4vaYhA/wZeNGa4J0Q1o/ctchbnVw53GsEeHHUik1fpgAur/
 NGMb1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9n9nv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 08:36:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0ab07320so35676951cf.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Jul 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931778; x=1784536578; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=;
 b=gs8pd/C92wYRcvhDBigrSGSz0SCoEcmZNeVp4o3RYHzELHvYSR923jLOgxCfr7lOPc
 ePG/kROA27SNKoHGBQJnHhFtlx5IWEgaYGm7zMcfChsVvysR6ciTP17JuBOldnlgCM/8
 QI61ZgJarT+OEgIaq4xB5YFenlUjI6I//Iqdti9S+rGFdT9TQqp3N2uprCJOv1IjiZzs
 CahaP3jnx+X69e0qyDJbgEeHG5uZD/d4maaNa+5yy/Ud+ulK6LBSjqbHjQYWzsTiMZL1
 BaIaOb3YfaS8AaQhAVHst09u+qQslzC9r/xGFV2LrKe9cZnvNw/YJ/W7/gPwmMuPbmlc
 cwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931778; x=1784536578;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=;
 b=esOry55DAqQd0J+FQXD6V9Rve8Xvh/al0Cwr4oeY3O5DnjWIaBI5mY1Ns6Flydj9Rz
 2O/r+u38CWHFO9CMfwSaSYLhCzR1uf/V0v3bUrPrnU7eWMDsM848lMyMwaE/yxdaWASr
 8fAx3qsSOeiUJbv0FpWnQVBuVVqpzYQ9qPT057YEgjdp6kAcxZeLwFtrF3W8RIuKhXg/
 K6E/12DCNwRrb+eNiBmKwqf1AcL9yUHXItV9UEiUNG3kuWUArNkSg/A7zVFlXqxuglD8
 N0k5erX3kgZGywCB8fp7DPZWvRtglN0SeTKxZYlBSa/2+hj8uNBf99cKjXVbMRr0lvw2
 1mNw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp+iUh1Y1hnPm5w7DZZsnPfBItSEEvJpnxOf+rsTUoD8wE0lQtqM/GwU9DCJ5jMMxRiX3bBGHWeIij5@nongnu.org
X-Gm-Message-State: AOJu0YyamAD3l58QvEr3/9gBFt83T7Axd1IiZqBzULKwhMKH1CsNL73f
 DJwllMPYzrc7LeqdjyrEBzg8PC7A7ccIUXuMY1+12CFCJf+h7gGRfjqucccSGDtqumomMCZbd7c
 4ZWC8B/GV5VKMXbcb6p4ZDORaTWPjmoFltiUzqhOKsVt//kf0JgXIYSpV2g==
X-Gm-Gg: AfdE7clWj2nn05RZRb5UwwwflIUq7AYCcSS/JeAsrfy2PA0NVCifsC1cfJZKD8WKbr0
 PGw9htuaNqCW8ARb/lVf5R/AXpYI77AqxoCbfAOOtIaMskQNanKwCkDuxLRxBsA64e/B9b3jkCu
 Gzck2fmbop8PH5WGJH/uHTITmQN9MZvYO/hDskh0gQhCPRbRVUcc9qA0HR/nxDrnZvswSaovZ5y
 HkJZRbIH7Oht0cuKrMCH8kP1cZYam1umq2UZ11H5ipLtYjDffy5CyNbT/gPZEsRSmbZz1/AHylr
 ctmiBbCIh46V0HTD9RCWPKuhA/K174tfP9aJUMGF14HOvNT5JoQitmD55eJkeR5heOY25U1M+M2
 h1BndRxY2cBkrXW78pKXGpsQrET8uTraaUJ1P1iDOBCCWa99spCdP+1tKF4DHjQ==
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:64a2 with SMTP id
 d75a77b69052e-51cbf395337mr79147891cf.70.1783931777629; 
 Mon, 13 Jul 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:64a2 with SMTP id
 d75a77b69052e-51cbf395337mr79147261cf.70.1783931777230; 
 Mon, 13 Jul 2026 01:36:17 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f373csm577217365e9.14.2026.07.13.01.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:36:16 -0700 (PDT)
Message-ID: <09dc819a-8bc9-41c6-a7df-8e684f4b7d3e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 085/134] pci: Remove *_orphan() creator variants
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Aditya Gupta <adityag@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Farhan Ali <alifm@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Felipe Balbi <balbi@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Farman <farman@linux.ibm.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Gautam Gala <ggala@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Jan Kiszka <jan.kiszka@web.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jared Rossi <jrossi@linux.ibm.com>,
 Tyrone Ting <kfting@nuvoton.com>, Frederic Konrad
 <konrad.frederic@yahoo.fr>, Laurent Vivier <laurent@vivier.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Bibo Mao <maobibo@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Glenn Miles <milesg@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Samuel Tardieu <sam@rfc1149.net>, Bernhard Beschow <shentey@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Ran Wang <wangran@bosc.ac.cn>,
 Hao Wu <wuhaotsh@google.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260711223707.42139-1-graf@amazon.com>
 <20260711223707.42139-86-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-86-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfXwEdIbgYvaTMr
 j/Uj6cJOCRnVNF29x20GaOMgqPlQi098DolZtLTmPK/kG/rsQmf8j5TuTqx0J7cLRrPVYZ5WZSt
 HR2LPEBP52yfOT37IFKQsWvSI9PsC0s=
X-Proofpoint-GUID: zHUdXj6EVQQP6FxPdD7DpoFpVw6cdw5e
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a54a382 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX437flJTHuV9F
 4dYnPmsgahoLrA2DoeT281tV5t/v5Q+vyfX/rCsPOWvghKrVbLvRWW/H4nfSCaD1bVOEdTXZqSo
 PvHajb2HSYVjjK8EyxoqaoLrDo5QMhabierbbs9W6LLDw5AsElqrbW/4+y4VhZFtCLD8Uut4pmv
 Kj29UqRU3yG9P/+sue4+vjRGE2QUQK3HdwfB+T5zmhKr7j4XkUWmnm+u2E4JuVHPBpYJBVWaP4I
 gyDU0ZhEgj1ucd2S30E29BkbSR2c1GuvJMvtz6OcbHLGeyZqFfPgz6p/yldLMbPUC4IcdH9Q5UW
 fJCPyCCrb751MlAY0rMXVYdB2tQZW/249EqtcDj0vXJ2bUbBov6S03EC5NiJ3e+1bFPyRSMCLfi
 42Q0l9YR895GO7X1kNxuxdDSu3gJ6G/WYWUMwQpRhgL4As8fY35uZHZgmj/yeQ448o56AxSHi/W
 50FbjqPmuqjExwMwiNw==
X-Proofpoint-ORIG-GUID: zHUdXj6EVQQP6FxPdD7DpoFpVw6cdw5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
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

On 12/7/26 00:36, Alexander Graf wrote:
> All boards create their PCI devices with an explicit QOM parent
> now.  Drop pci_new_orphan(), pci_new_multifunction_orphan(),
> pci_create_simple_orphan(), pci_create_simple_multifunction_orphan()
> and the internal pci_new_internal() they wrapped.
> 
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/pci/pci.c         | 35 -----------------------------------
>   include/hw/pci/pci.h |  5 -----
>   2 files changed, 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

