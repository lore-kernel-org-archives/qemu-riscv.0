Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A26C5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:54:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtG9x-0002w1-Sl; Sun, 09 Aug 2026 22:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG9u-0002vg-Ou
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:54:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG9t-0004Sp-ED
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:54:38 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L7kKO3049572
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 suiS8bifuUcVzwQvQASgLGT2oZcGYAS9MWbTZ41EJRg=; b=Zu2BC1NPny+IFhkW
 5Dv1P2aX/bYLnYKvl5UCu5Dz87r96G6FYa32mW7XID5GIDdGnTbWmVRnvWMicWiM
 o0/Ra+EX8rdwpCJQDd/p5JJvPOUAkJdUdH8iQk2yjQ+/Q4RAuiiCwtP9laL37KYt
 JJvRrfJ4SvKmCItEGV6DE9bGEfkLy2w4gxZTD4vVd21Lu1qafCfXbeeT4SGVyCih
 dw6F0CRv77Y0mq0NPliO8sf1mdq9OqgK2K2T7a6kJGPUXlo7UKDX6d9va7wMGLMK
 P2YUmou3VlSRp2GTD5vsRWlVdpUm72KMqwX5OkGsIw/v54uL1TatYwPdSDefITz8
 D7AkmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgv1y7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:54:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51bf321d786so17896051cf.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330474; x=1786935274; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=suiS8bifuUcVzwQvQASgLGT2oZcGYAS9MWbTZ41EJRg=;
 b=FszaI+ZHmtHogLEVABgI+KnQw1HUtw+OR3pK9CdcggU5OXMZPmHdMDzuH/C5qRQpkT
 6RH7lWoQ+2V+8RMDqsYNR4rpAL/7ZIDIUHOyNE78IciaBvW06ALLuNfe7LEbdRH6tdCE
 zVpviWjonI1YoMmEWQg+vPRS4/m7wK2zTB1rO10U8igHIkhBXZaTWkyZN68kq1Slu19g
 +zIQffgciidZQ8GFXEiOTCBtV6Iz7RFm9+dzyD9VOV/Ts6hSHEovNBni5GOPbrEUvzyg
 qwzm0tqLwFMc8uLUrYSMT+k5AgLv1czzuV5mKs1N6bB7hGAuvJt90RWI5S6wniIfs0kR
 ZGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330474; x=1786935274;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=suiS8bifuUcVzwQvQASgLGT2oZcGYAS9MWbTZ41EJRg=;
 b=qYCeWbSHut4WT7FjHZHHEI/mHPXIC1Eg4w8iEE6Z58GEqDPcCh46+9uXPDfeM3Sk0l
 ov/rDuDTUDGL8R28hYUyuskMaNtEIXONJKM3gqzNxlGrJh1zc6gqeq0gNIFY0oEoDNit
 zolhaz4jhvdrkzgvdgkm5bN+MN/LLYBtUMzFNScp8X2vWbMsmgCN19V+J1GvFDCDgM2d
 hbGO8Dr+BFOZqAbW1jIWmmW3ZdxklDbolHj3t1JU1MzB9srVCWyYEWpCKSGCEvpK1XYi
 mppYUwG2hnWrkfCesgUNYfczoNFhm/XBsxF5ne7CTp9EmfCshMypGpP6itli/i9cONor
 nMQQ==
X-Gm-Message-State: AOJu0YxmCyh1klWQ4WG+N8LFfJ4fkaObhH4JyTrFffUqEzDdrXuR2igG
 QQ1otg4wZwfVaJIBIZn+y5BJsKOEH3YrQF9N6i5FD55PlauhMSe2U2Ktj2jfVYxnzDzyAVHuCP4
 8up1KRl+ST2DEc1T1xT84WNq3llSEgOqDj5cIh91tgjx4VbDPV09Q8hNbGg==
X-Gm-Gg: AR+sD12FEGT3jr6IciN0YaWgoI7o4RTbVneSAjTjOWMkIcTmZ5e0j/qagkv8J8YUBAo
 K1lVftdOdTOCZdr10Su0GXb8QcqvQmiI+wEC0YoiE6L4xBEE2b0/RIJ8v/cHFU7SvtA4kKpWWSC
 kMSoCs1ud8cW3uTPOfxjuJltu9Lx0FB4XqFZ2uAhDCBZMQC7mS2w/P0xVYMvvMg6x0UGR7MHlcH
 KVT1EjHGbuncBc05na7usTUi4uv6aPTB8SzZLS452OCsQ5yJgUDJwJ3+wkMK52lgfLFxXiae7lT
 TYzwRiD69+RnTIX4GTS7yMYr4rBPlygW0tCw2pmWfMzYdJecBipaE2vRqYxQRfQIq7yw8DmsQpi
 uFJMSQ1OZ0ICbLYw5m7POrdozK0WTF3/Y2ok=
X-Received: by 2002:ac8:5d86:0:b0:51b:f217:539f with SMTP id
 d75a77b69052e-52d18e6eac3mr202720511cf.17.1786330474379; 
 Sun, 09 Aug 2026 19:54:34 -0700 (PDT)
X-Received: by 2002:ac8:5d86:0:b0:51b:f217:539f with SMTP id
 d75a77b69052e-52d18e6eac3mr202720231cf.17.1786330473956; 
 Sun, 09 Aug 2026 19:54:33 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995c69c8ffsm197430355e9.2.2026.08.09.19.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:54:32 -0700 (PDT)
Message-ID: <00c35d87-6d4c-4a49-be3b-533bd38068e9@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/56] disas/riscv: Reduce rv_insn to uint32_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260809223545.730664-1-richard.henderson@linaro.org>
 <20260809223545.730664-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809223545.730664-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX6QmnhatmSl88
 WrGDSbV9ORX29HH/+YdEJfwhQ5j7HQoIIC/BGx0yqpagQ3NIY0veB+9k1W0fgUro9Ig1PC99TMD
 Non7e0x5099w4w1EpX7DyZqn6n9oNlk=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a793d6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hYFMOUHwpGc7NNowlJQfBPsmVtzYh57X
X-Proofpoint-GUID: hYFMOUHwpGc7NNowlJQfBPsmVtzYh57X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX1rvYQ9wIP74L
 MvhBkazFjwhHIbBfObeAboazCzSnGnkNho9B3pv+sel4jUH+iqHmBqXeRp9rW6yiF9WPh8mggtd
 R2OEv/kaTjXp3CCLY66a/P39iZFfUJTwWFnrk4pW/ZUBqyIrYuEuw3lFh0lbaZKiT8BAnMyYvL6
 hvd7gNyKbVN7Aq36iE0gEfioKPl/lNMz7qUQv7NQXvymlv9PLBXYJob0U5UPsUayiTz08PKDDrZ
 cV028Ry2qHjbS60SyE0I02RdyYdib9hBDBLbdfGSqTUis/iOisDFtVvy6tg5wfCSgtV7JEuDG3e
 B0QvCM4n246q130KH9ILIbu7jjiM68YFhGX/legxh+iqorUh28/UFKlILG9eT+sYjL0/jP9VZ5o
 ffX4rIix3PSCc+FeG5K9M1qfgXzzqF6Brb9Xv4wBsOTnAOySTpT4W33bN2PAZDe43+LuqOUQpce
 90QE2lIVW8kn/At55HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100023
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/8/26 00:34, Richard Henderson wrote:
> Since 758dce9c98a, the only possible values for
> instruction length are 2 and 4.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/riscv.h |  2 +-
>   disas/riscv.c | 12 +++---------
>   2 files changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

