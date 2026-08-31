Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC2C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:02:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0u9Q-0005i4-MJ; Mon, 31 Aug 2026 01:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0u9N-0005hb-77
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:01:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0u9L-0006Sj-RV
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:01:40 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V1bf9j2083185
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FuDDS1Ulu4DUR8FA8LQLoCZjbUgOpGIww0AMXWy7CU0=; b=SoECXhZZeMZrIlZv
 wDRwbjUPW1T3DhmiJZtJ3qg+vNiuE7F+d5hr0gHzs6x2LwOaNg2KqiPqE43TTySE
 VcNZWNvAYSmtD3cgI48zBwFv55qOww7vP9722gYYewszBzvF731UJAHgFVd/00Xe
 IHDBrrTrQm5KcukogVX4XHZQotUsx74i4jhgBCoDORsoNXIAa7cMiBifOIy4419b
 Fxmk4jvSnWIjrDg+ThtG+5Z+Se9xF06Ptog7mfruTXcBa0Vs8scg8SER4ognKRAP
 BkLxti8lXYd6W35M05P0/whiHhydSLNUm36qGd67U1TcD/CrAB0VwsHTkOonPH3V
 rX/d2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7w8w35-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:01:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-938153538caso552104285a.1
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788152498; x=1788757298; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FuDDS1Ulu4DUR8FA8LQLoCZjbUgOpGIww0AMXWy7CU0=;
 b=XNwXHYHv23yZu7AH7JACQvw5gQmykJdDvAyWEzCr6TvYQ7FaRUSOF87J9AswPoIavf
 FkXW6CWjcdCWc10IgBBuTPzSqfH3gAlfUOyoWH/76jNnzZ3MMKr0O8VshMZXq3YsqnVR
 P3FCRsISqg+eTiwg788UZct/bHQuFTjT6Oznd+TY3wvN7OK6bdUN17Pn/52dx0eh6cv1
 lu/zZinLkmJiuJIKpUinFRMNR0J/NFYF/aaW1LPPz7VxtMZDd5cinGSapy/ra27Xcfvi
 ZY0LQKu3jwdjIawe1YmIOUqMsyl7SnO5NwEsDMciMfNatb/N5bpwhGzgm7f/JChi59Yy
 BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788152498; x=1788757298;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FuDDS1Ulu4DUR8FA8LQLoCZjbUgOpGIww0AMXWy7CU0=;
 b=Njj2HeZEdPP9S08T1/LnW1QHrU9oaYB6ycz6zDK42u8/gXpVjaqhzzo647tx23JyAx
 fgAQvmCM3191TY0ncd8IHhhVHviwtAeZiw52bzqjuoN9pJXw1l3uZ5mPM+Mp9sMYg60E
 nhDjJ9ZUoUiFkPFULxyYpCGY9GS6c4fH4X8tkAsyFORuOCSduYrUf9SwWAIXpldw9il6
 ZAmnhN2O9kwDoDzKWuIfoby8JUrxr3acpxfgF46JDxYbq6UUH27Uq5Ky/VIHMe68B0At
 Q4k72jzO717NyywijO3GmLi3TZDk/sXRUxJWGf7zNTs69L+9WQyR0ovff48cJqpx/v9B
 cq+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxM/gS/SSVUu7KAlmoXL4Q/lcJFgHIXNEWsnNE3LSQWUTRV3wwNE1PXpGzlRvTitXk6MIZTV5yyDDB@nongnu.org
X-Gm-Message-State: AFuF++lqSc2OUM48joUGLXOyA5yr924vInGqPzb2PW+MDJsx0hMwgXN/
 pULOXYfsy6Nz2a5MPAaF+s/YxR0LKsiycq6HEgOO6pfFzDBsbH77Q2TtlDNbZD7DMd7jRGs/opW
 gjiQ/MsrgZ/lY8+0tRSt1S9nzMEz0aolxU8Os9YfAXbdU9cwSgQ/U1UeDmQ==
X-Gm-Gg: AR+sD12jX4f4D7CSez5JzFL8JCuXc1ap86Zz8M16gqeRSxTUGb9Qr0CKaIHipw25JuI
 l7m19d7Qf6wPYC7nztOVhEYKyHEgva2BsQUyPOJLO5TV5yUett+Tx6LQwwz5cvJxZXYlp1rp3n+
 FFrYmVfXfQCQgsmmJqxPMjD2tNg7za8XLLa9nPPubfSUReWMjdt6dHpY/NZGcqNYSCWGD36Sp0z
 CRjtIx9FfYA0m3W4Jt4yw9xE5G8GNd1th9w7Fu0e3KNdLpdH5eONxIzSxsmL2f5Ij/eTrP7564Q
 SC6SokaAVYRvi8XxULpFAWvkSKIR6lXtCq8PLnA5tLL1NZtrQ6t4Bfyh1/MvCR2FAM7K5g+t97p
 hYkWCjeLiZTPvIgYgsD2DeDza4eH6shEO9w==
X-Received: by 2002:a05:620a:2719:b0:936:e702:51a9 with SMTP id
 af79cd13be357-9391395d467mr405424885a.36.1788152497907; 
 Sun, 30 Aug 2026 22:01:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2719:b0:936:e702:51a9 with SMTP id
 af79cd13be357-9391395d467mr405421685a.36.1788152497573; 
 Sun, 30 Aug 2026 22:01:37 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942298fsm352383635e9.1.2026.08.30.22.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:01:36 -0700 (PDT)
Message-ID: <0d9d86d6-a66f-4692-8cc8-0d1df6c9a1a8@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] hw/intc/riscv_imsic: Take a MemoryRegion for the
 created device
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
 <20260831021500.82565-4-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-4-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a950ab2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oeOAIEJQpRq6JHWgIQkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MCBTYWx0ZWRfX62nMYpdD0X8f
 JsV3isnAoVIefAarDzpiif60SZDtcVxl60EXs+qiVhUZm84bwDoHyD0Gl0cOuZGvkKAJr1+C+xX
 LWzaqWfAlyO7/YaCFNwoYcudSOKR11A=
X-Proofpoint-ORIG-GUID: f1WAmZcNSol-yBLBVzV9Fk8M5f2IUMpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MCBTYWx0ZWRfX9QTsucYVOb5P
 bhbpnG0oXl2fiTfN9lIqIGo5fxlSQgLfEY7AvWMsoaMK+IkrDtSGtDQcDgdKlEs7sebN5siwZd2
 Rf+vtu8opVReD8GWBiS7qx5R9M4AAwnfgjPQSrk7gYem6uwmVXqieyNHpcIItzcYVHagN3C1GY9
 Le7EFBRf+P1lOT/eO27B7cDvyzjVXVXpbPiJ5A10lDge8rWHlZRcj+9QnIMGJN9IbXheTJjhtqo
 7N1QZ31dAIDHGPyKb6ks2wLvCIzlFsGzuhqNzZNZl6uU/HXTUcGzV+1v/FV84l0KBgI54f725Nx
 K1NzLRPOWFNVMIcb0BlC4WWcprjKEJs8iaz2Qu/wCdEdT/9v3bE/D1dTpipXgm6Hnt2k4l3+uEu
 iVJOkM/x6vYPle/Bdw3WAy020Ond7ATtzfMUeaEp0tcUPkfpz7iTtpLjeTzAAWK9rYjkM66bBsc
 0r5GzgBoDgzuYzgMpOQ==
X-Proofpoint-GUID: f1WAmZcNSol-yBLBVzV9Fk8M5f2IUMpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310040
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
> riscv_imsic_create() maps the device it creates into system_memory,
> which prevents its use by SoCs that map devices into their own memory
> container.

Reviewing previous patches I was thinking maybe @mr argument would
be better named as @container. This description confirms that. Not
a request to change, but still mentioning in case you think it fits
well if a v3 is required.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Add a MemoryRegion parameter and map the device into it instead of
> calling sysbus_mmio_map(). All callers pass system_memory, so there is
> no change in behaviour.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/intc/riscv_imsic.h | 3 ++-
>   hw/intc/riscv_imsic.c         | 6 ++++--
>   hw/riscv/aia.c                | 6 ++++--
>   hw/riscv/xiangshan_kmh.c      | 5 +++--
>   4 files changed, 13 insertions(+), 7 deletions(-)

