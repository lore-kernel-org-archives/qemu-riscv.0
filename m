Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BD7CA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 09:07:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xENIW-0007Ad-KR; Wed, 07 Oct 2026 04:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xEJpT-00013W-8r
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 01:04:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1xEJpR-0004po-9M
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 01:04:34 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6974laRr3929966
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 05:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=c1rRqeyH4w0vKFb9+WC0eZ7nYzuws23d/YTa0al83UA=; b=FA
 ymzvjcxoMrJSSBtF3MdX3mU/3uCxindCHzcTIcQeaXvDyRJdcz6X6k9/TCTZQrEI
 B/w68fY3vZkbAm0+CHtczRxGIc016KVzsIGDCA74UknXKeCE3BrkV5mmW57i+3AC
 FtmvbH10nuQG6L5BvAXk62sWXH8J8jwpWQEUwTbs5HrTWyOpowjwNhG3rRBzZuYY
 rGGnuTVaImARsNEGF4X3zNy5Nw77nLp7732QMj7LAPlnujRH8yvmAeKS+lUERjuQ
 L0N0YHpibrC/Ca0YtKR/2rQh/MJ6U/IREXd2N+B1TxHmXT6NmiTP2atYZLo3eBvT
 9ALYtNDEIsAjgxAGm67w==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc581et-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 05:04:26 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-677ada64e84so5849785d50.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 22:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791349466; cv=none;
 d=google.com; s=arc-20260327;
 b=SJEgYHKVY76aF4DCpfTKLiQ6wxTQYDaRaoTnGr7PiAInzmferwIYuL+fdEN7ymz3U7
 qPwFDCAWnJwRWI4SsQOwFIpGeGzat3Px4qmMG+pTMBvZOfHJ+DutUNPqrb4RcSIF8QO/
 Hyod5UHKfvVkq4R3JgJu7X7iuvgZ0bMy01ibpag4ApoeOMhQV8dNIr0vglnoGbbf6lQK
 LNvkWFXGxnDlmphCbN5LK6HWKR7F7t5yjOhFmnF6fi90W45Lik5lWPcGJYoDNpUfRq8H
 I+bkH/qwsVWS8ji4U+nbfpJFALze1/EHVF5SctiOArbseqjOTay1q2iGnI8atszuGXf+
 OIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=c1rRqeyH4w0vKFb9+WC0eZ7nYzuws23d/YTa0al83UA=;
 fh=ICuPxiZLreGwMRRhOBT87FTqCUOtLimUKvzNFUXmKks=;
 b=Z2j4I3LU6gTytY7hrLVj0PsTTVXzP48oC3sDNSoys/RFVkJRZOqe6rzIaJoOEgUAPI
 dw15sTOC+V2JqfTHDfXfBNs1GbCzsnY2+utQZVabvyurXsdrT9GfEpDFcITdVEKx/MUu
 oL1MGQ3KtdHbChkDnIFZLLq2rqo7+ovA531/el9cPu5vMpcy2aXkVA9B6tHC8Yvz1zg8
 U5G1knc+bEgmUIZ1EB7nbaJ38+Ed49RkfzAQNT2MBJ0S5daV87vmLuPfFIf5m0tw/Gb2
 1PEPI+m7mExt8CuRFndEe0KzmrNqbmfcRph3kT7GrXas3oFinZzg2AJV4tKLYc02mG6A
 DK7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791349466; x=1791954266; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=c1rRqeyH4w0vKFb9+WC0eZ7nYzuws23d/YTa0al83UA=;
 b=jqn+LlSujHLFPSoAnyTNrY7LNxBfGL0GSqeGi5eGhec3Nl5v2/kXQSncD3YdBjV5KL
 VX1QUTpVpb8mKjDk/WTT1K0+WEOj8LBcVG6WqnW4fhoRqBxEc1g5b2CO6RYXDit0O9dB
 BWO92DTThbkRF6bkZOqbZhBZQYjDtJ4/bYApNqgLTJwUFvKyrePsBAVsEC3sDSvALE6L
 bTfY7vQTywRIb2/GaR9SsR0UFEOps1s/3MGsbRdZ5EmmlkoktMi29QtIHF1mr+u+l19u
 5WKShuvew6CHPEo9imTeZNXldrZi2Fb+Yt5UWRMUOcI0mJiQjmaQ4j67gVeaA6Lmmf+s
 6W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791349466; x=1791954266;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=c1rRqeyH4w0vKFb9+WC0eZ7nYzuws23d/YTa0al83UA=;
 b=sMlxGmvX2v4oI625ebxMmw3NWXnvGpcNzTPlLn8F5nTseSrAVAQUINP7XzfCj0ghC5
 SHKTvHPD4ZLhFIlCWfaIGBUseZaLDHP/n7BoPfWQq5cq6nzYENT/oj9CSuwTOg9itbio
 HNMKXxw51mm6TupibqWCgt77U8po2As3ncx6HnfH9+Y2ee973JZtNmlZAn8ux0Mz9AV7
 KkaRMy3ZQ2c3Ui+6Q2R5YUWvLJI3Hg0vtqoFNKZYSoc0rEwgSe2C3SyiXeABiBgC8CyK
 Dp5m4f26oLWJwb5RUONuCO2ZZbgVNLrKseWadJikSRSREC9Jb0i5NRpBkoyRj86FvRe2
 EOZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/x8zjJnq7+ESx/m0407kZbiNSVxLO5t1MxSO0M01jvyOTxy7wr4CyK1tz2SQuCfOwlY9g14fzzcTf@nongnu.org
X-Gm-Message-State: AFq9FYIS7NSB/lKERnwROm3PxpQiKchuSiZojh1NwEDoFocObMkTkbBR
 X9RisxUL8zN1gZc5LIfb+U/zdYEzjr7Nxv61/pLFQbQz6GbyJ5uR83/5OP4c2ug1ubEHd/zXC9Z
 yg3JMV9siJIlsBQhCJYAiOZiTFFXLUyJ/c49Z+VmBLHdmTicj5Fx6mfmvxpr/fbfPQ7MXNAJhJx
 1VTZSPZfeFGj5FZTGQyh4FyIUxWlNrRmB1
X-Gm-Gg: AYBFou3yqu0Nzj/NPefzgCXj2RcuB5tGfZek9CMKx7KrUM0V7yIfv/GoV7ykEIgydSG
 H3Vf+D7b+pHKFrzBdcrBj76M7WKt4BTTA30iePUDD+9SyxxuyrsOjZDnDQP6+RjGZ+cmO/Km9Wt
 q6jf/1ZPgfPnGhIuhFhjMjBcOrV33o9zxFC/VYiATDQPTkIHTxGmmlYueGTw==
X-Received: by 2002:a05:690e:4808:b0:677:d6b1:d993 with SMTP id
 956f58d0204a3-6790a061729mr562001d50.47.1791349465696; 
 Tue, 06 Oct 2026 22:04:25 -0700 (PDT)
X-Received: by 2002:a05:690e:4808:b0:677:d6b1:d993 with SMTP id
 956f58d0204a3-6790a061729mr561997d50.47.1791349465281; Tue, 06 Oct 2026
 22:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261005104008.214588-1-rick@sloservers.com>
In-Reply-To: <20261005104008.214588-1-rick@sloservers.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 10:34:14 +0530
X-Gm-Features: AclHuK9JAPzZ6hSQKUmB7VNqa6_iZP9uHR93vpDxJ3KPpqQ9dSBMR3wZebz221E
Message-ID: <CAB19ukGxy1ZQpU-HfNaEfcUcQ0e-=OiuR8NcJN5d0pmAg0d=FA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/riscv/virt: Fix the UART register width in SPCR
To: Rick Richard <rick@sloservers.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAxOSBTYWx0ZWRfX8A36T+jzEGSA
 y5NiuZjHIl/2JbUyyDgA+O7VYU0Kd8zAZdEmQhZOX8WK93AsUYhvfbHOrYrJpDvLT5EUM3Bi6Vt
 bcosiog/dRb+5gbjESEDvYhq+Y5jHqw=
X-Proofpoint-GUID: qyOyolvwfQ9RiX3TI6gnc_T68a35jWRi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAxOSBTYWx0ZWRfXyo6pxtkSViMZ
 QwC5DVIszFxQeLIZSyO0NS9FNEkzgTjCA6W08EaYx1Q+NEAP9dtJqZiLLnH6J8WguC8TLuYrnVP
 djks/gkqmMCnV7G7uivuRhWgmHxU527cr+rw6LbVofObyJuJXzY9ik7s3/DScdTJzymmY4C+CzB
 Z9R6w8RymHsBAOOQx1H7yygvZnQepBZ6V4plMZiRAPHtff2XPe02DwE4h1DjH8NcYMPanJcNlVu
 ix1c9KU688KWxk2eZyJaMmsonIReZ2VrFXzFfGzkMEpxSR8XXjp5KhIR7/1pm3858Q18uc2SY4L
 S1pXM8BI5VJrAp4iumJcdL6OaynTcfMeZYv6M8A4MAAoKKiQ6q7bfP1If3FVNo9jB6v2k1mjQmX
 v7JUKhQvWq7eZJT6CDy1Txdzs9qoNcxqX5XOdykZ8MjBS2xO6yXt3eQwmyujDSXyrL/NwufsmqA
 +sAl8BjXyJ+wXOd/EKA==
X-Proofpoint-ORIG-GUID: qyOyolvwfQ9RiX3TI6gnc_T68a35jWRi
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac5d2da cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=F-tV29oOAAAA:8 a=EUspDBNiAAAA:8
 a=t6KeD4UUR2y4snKxGncA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=Y2dezMJzicAI2PZykhZh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070019
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 5, 2026 at 4:11=E2=80=AFPM Rick Richard <rick@sloservers.com> w=
rote:
>
> The riscv virt board's SPCR table says its 16550 UART has a 32-bit
> register stride, but the registers are actually byte spaced.  Linux
> doesn't use this field to work out the register spacing, but FreeBSD's
> EFI loader does, and the FreeBSD kernel then crashes on the console
> UART when booted through EDK2 with ACPI enabled.
>
> This series fixes the width, plus the usual bios-tables-test patches to
> update the golden reference so 'make check' keeps passing.
>
> v2:
> - Keep the relative file path in the patch 3 iasl diff (Daniel)
> - Add Reviewed-by tags
>
> Thanks,
> Rick
>
> Rick Richard (3):
>   tests/qtest/bios-tables-test: Allow changes to riscv64 virt SPCR
>   hw/riscv/virt-acpi-build: Fix the UART register width in SPCR
>   tests/qtest/bios-tables-test: Update riscv64 virt SPCR golden
>     reference
>
>  hw/riscv/virt-acpi-build.c        |   2 +-
>  tests/data/acpi/riscv64/virt/SPCR | Bin 90 -> 90 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.43.0
>

Thanks for the fix!. Looks good to me.

For the series,
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

