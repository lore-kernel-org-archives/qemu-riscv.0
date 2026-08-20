Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B34C5DF87
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 11:02:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0Wu-0007XE-1K; Thu, 20 Aug 2026 07:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wx0Wr-0007Ui-U9
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 07:01:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wx0Wq-0000Mj-2U
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 07:01:49 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K9JCex2927102
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 11:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0K2prfGN8PN0uZoJVgVGaeZmO83BuRVS0OQOCrJsawc=; b=AoCAdJdyyzc9Zw7K
 852btPtuQSHTS5tvIf+Eb7UJTj0nklFLKmc7sRRATegLpG/4rcow5hiogSvDu6zH
 8EsP56mkQRIGA9K7XfEQq0Y6LudMNsGt47KsKDyt1c8IlL1EAV95ohireg+DnL4P
 GsKsuJlNB1ks4F9hQzs1til5XkhvBoAGXpgdO0iMkMHG7w1gZPLc2mH7LwVpNxcU
 nmS/H3tB5u4FcIT7OCbF9xP2dkNEg3mp9ZYNY4+IELx51vfu9Dmmhyws+ycCSd4x
 3O4tI6cq0fICnUTXo2juQWU3TSlNBUZdo4ISw/6VY/a6nzbp2LYRkoVypsLfzM/c
 zuzM+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0cyd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 11:01:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e63df032bso90878685a.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223705; x=1787828505; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0K2prfGN8PN0uZoJVgVGaeZmO83BuRVS0OQOCrJsawc=;
 b=ivzBr/vEbDnfcq22OfNrNSSzHPd3kAEZAJVD4RAtnlaECzqNNhnmbpugLoJ3X3zzZJ
 TxPoZFMXw3buHOMrdIrEA8pNvkNKzyVzw0+ay1vx7KWlH+BlAYfBUV0TNdX9wl3PIN8/
 YstCjnY8Iwt0ueRSqR2XtceIvCUNyCGze/dezXsYt2VIGmJ/UJ0K26gF04NzwGQlylq8
 SQ3yTbgpodk3C1Rcv+dse8GTCzD2lbH+KzjTjlKu9Aihy4SIBmcdEv9gRBlrQxhE0sbU
 ENthsQ3llSpRVdVFAwROYzAgxU45Qp0pI4QMEFcKkrUtwsy5HDCKv15+pBqP98GOQq4I
 SPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223705; x=1787828505;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0K2prfGN8PN0uZoJVgVGaeZmO83BuRVS0OQOCrJsawc=;
 b=ikN76OzPJaAA4Rka/hTu2+JkgiUmKoVB9+BuD0qV5R7DFbywWbNq6aJq8QRoucPfzJ
 yoydKnFy4Yjo3waLP0nGynyEIh98RmeuSQK5pCGHT8sswlJcspWayKIoIm8QMVAsFt9n
 f7fX6dwmW8WP+n6j+LpU8BlOrwbM7JFFlmuakaIirCFUTn5cEaTo0BELA7fH/pcA3BIF
 /uvIMzhFQDruZvnbp1WX7etnmRQIeuiKEgDybmMx/bJFASFUcl3EfOAUtc4Bw7nXHga3
 gvapGeJUyjEvf2oN5+6BTbnD7IoGjeeCL7WT9TvHhvg1Y/BHGeD/BHLXnXtLf+E8xSGz
 QMpw==
X-Gm-Message-State: AOJu0Yyzqv2WfbA+Q9z/ayWc1CetQSnNoXCQOxkq3HWUKtgcLzXzuR0i
 HOCWz7QVuIQnfBo0JWwr+7PGC4OUd93guTRPnJJiMf06y2WKWSPwGn0zWZ+Q/kyhs0rGDPhp4NM
 q5/R1Hc/pcIkWrR5b4rEh7BPCwpnd0i5yfzJC6jgeSH9mYOqcxCCHaFdO6g==
X-Gm-Gg: AR+sD12myWWNoFkYjyHuLdqf2Yp09uGsp6fbszjhyB3VggqnizvtfgpVSlRo3KTSe1v
 r0iJN3zN2fIIhuxvtX6kpptz9eoSw4TMaQIkV3tabBL4uUShPeCfNngQoTN+abbbghEkmfFW4iC
 44UfCSGgpN1cllFx32sFZavkCYHDJjgi8stYCgDXsL9+0AxY7RD5QdVbjO75qf5SSQ8zzABmZi3
 fU+OETZ1CaCCQaAjr7HMks3Jb8mH2Z5zOJU9LNkbyORPo5JTpPxuM1Uc3QR7v1Sj5fae532DWs4
 dS5fkkFH8RTKRQ71lZ7XRWsGY3s0vmndZnIHkOT8wT7t/rf26NO5yft6ADRuegJ/n49Nrc565bZ
 4+vn6fZzV9Zq0Ug1zndnhCCuBWGd/7u0eswbT
X-Received: by 2002:a05:620a:7003:b0:936:ce17:7792 with SMTP id
 af79cd13be357-937283bd34cmr529470685a.8.1787223704616; 
 Thu, 20 Aug 2026 04:01:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:936:ce17:7792 with SMTP id
 af79cd13be357-937283bd34cmr529463385a.8.1787223704172; 
 Thu, 20 Aug 2026 04:01:44 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-937205709fesm340419685a.26.2026.08.20.04.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 04:01:43 -0700 (PDT)
Message-ID: <748104a9-5917-46f9-aa99-bf86ef66e9c2@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 08:01:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] target/riscv: support Debug 0.13 and 1.0
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
References: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lHIuCIoqNJJKlhfOyAUwH5PI27EZ254L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX/6ltFd2KbT2a
 j/ycRsdxfqh0cqH4BgCW3k/GNJ8xbMvIcepy+zBWm1mmtgPkNvZ3hfuPFdNHrOGWwJxdDDWfUDt
 ydazboJkrmwf6J6ssyruOecuL88Wtbc=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86de99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HwFc7jivAAAA:8
 a=tpW53qHkGGWegcDA2EcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfXzVoKxI/wnTXL
 EIZdsVM2vqcCRmi95Nwd/1Iqy+zwI3voTWvdgESuqTFBrgxyConAgvcal18++Ws+3Rb3lV7e9De
 lAO9TuL23YhB+wJTqYd8qqbFElsZZN72jku1b75hyLthU3ZB7fwj3Su/aoG/IPf2rW9B/+TRBQB
 0ReEnxPOVHFWwQIw68E/Tpru2ijs8ui8sceqPxTXu/JZsz7jn3CXMTH1kA2dxaS7w6/fWK+RspU
 JcR3g9X6naIXJPAdtnWB058QxQ55DgbwpcUouwWFUfWWx41fUPWT1M484r1Ij+cDwdG/tguLm/Z
 3GgKFedUp6TZd4H6cTAt9+YtzEiS8XqfvrlqVue+7WhNViISFBZfagUA87iL0+Ss5yWHIxzNxOI
 wr3+3ZKIcX7dPsBqXN+YrgbwO92NdR7IUBFvsQmYancnU7tsAEn8SKIqGuQVPN1bJc0CndHQEzv
 CINCI+GBehiKoM7ljkA==
X-Proofpoint-ORIG-GUID: lHIuCIoqNJJKlhfOyAUwH5PI27EZ254L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Ping


This is the series I talked about in our call last night/earlier today.

The v9 of the riscv-server-ref work was rebased on top of it, along with Chao's
sdext patches.  As soon as we get this queued I think I'll re-send Chao's
work next.


Cheers,
Daniel

On 8/5/2026 3:25 PM, Daniel Henrique Barboza wrote:
> Hi,
> 
> This short series adds support for Debug 0.13 and Debug 1.0.  The
> motivation is simple: we need Debug 1.0 to complete tue upstreaming of
> sdext, which is already fully reviewed and acked for awhile [1], and
> then proceed with the upstreaming of the RISC-V Server Ref board
> (currently on v8: [2]).
> 
> The work is based in section 1.2.1.2 "Incompatible Changes from 0.13 to
> 1.0" of the ratified 1.0 spec [3].  It ended being simpler than
> anticipated because we don't implement most of the registers/bits that
> are backwards incompatible.  I added doc changes to explain the
> rationale used.
> 
> After this series:
> 
> - 'ext_sdtrig' refers to Debug 1.0.  The legacy 'debug' flag refers to
>    Debug 0.13;
> - setting both flags enables Debug 1.0, i.e. 'ext_sdtrig' takes
>    precedence.
> 
> My hope is that this split will make it easier to to move away from
> Debug 0.13 in the future once there's no more demand for it.
> 
> Patches based on master.
> 
> [1] https://lore.kernel.org/qemu-devel/cover.1775959096.git.chao.liu.zevorn@gmail.com/
> [2] https://lore.kernel.org/qemu-devel/20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com/
> [3] https://docs.riscv.org/reference/debug/v1.0/_attachments/riscv-debug-specification.pdf
> 
> Daniel Henrique Barboza (5):
>    target/riscv: split 'debug' and 'sdtrig' flags
>    target/riscv/tcg/debug.c: add Debug 1.0 'pending' bit
>    target/riscv/tcg/debug: adjust 'timing' bit for Debug 1.0
>    target/riscv/tcg/debug: set tinfo version if sdtrig enabled
>    docs/specs: add RISC-V CPU Debug support info
> 
>   docs/specs/index.rst              |  1 +
>   docs/specs/riscv-debug.rst        | 68 +++++++++++++++++++++++++++++++
>   target/riscv/cpu.c                | 21 +++++++---
>   target/riscv/cpu_cfg_fields.h.inc |  1 +
>   target/riscv/machine.c            |  2 +-
>   target/riscv/tcg/csr.c            |  2 +-
>   target/riscv/tcg/debug.c          | 51 +++++++++++++++++++++--
>   target/riscv/tcg/debug.h          |  6 ++-
>   target/riscv/tcg/tcg-cpu.c        |  3 +-
>   9 files changed, 142 insertions(+), 13 deletions(-)
>   create mode 100644 docs/specs/riscv-debug.rst
> 


