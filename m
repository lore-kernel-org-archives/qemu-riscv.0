Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEC3CA5FEF
	for <qemu-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 15:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDOHi-0000vV-Li; Sun, 04 Oct 2026 11:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOHh-0000vC-Pq
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2026 11:37:53 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOHg-0006mS-6j
 for qemu-riscv@nongnu.org; Sun, 04 Oct 2026 11:37:53 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ab37e44643so6211527b3.0
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2026 08:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791128271; cv=none;
 d=google.com; s=arc-20260327;
 b=QCKhkMlvb4HmAw0+CFeqXMZYosYhcAIYztfBU0LHiYoZUwEvtG5TPasRovcYePUyUs
 IFapIipNZMur6LMOJoRDSjtxXzfogYG1mOsIm8RRaay2GWOrMVCEnmIFLM8f/yN3X8du
 nem6VOkEobgNmaB4o+tlkxCvhkTkhO8SG6May5K6tzZWzTr+EP3iXVkYfO5dVFnaPP2w
 MPIQQMlElQ4xgiiRG9mAFGiQTFMqv1KJHH+Qvfyq+bz8rL4AU28jtFB7Aq+cme4VgzR+
 OhDx8EACRP3zfXf22gOrceScQA4/tp1t1YD26Ei8zzi1XhxB+37DvhO9m+DfspDRsxRk
 KGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RcVUgNfznVI0SNePmkcCKBmBEyIQj+7JsvQtdgF8L8w=;
 fh=B5HyojOn8oEM0Kfh/I8vsu5AJxFRAPr0TLs3w31Ft+I=;
 b=W3eWtKhzGP1xvYSC9JBOe1qPzUgJx3ZC5FpuZvZVKGKcP3QunnwSmEhjh0YyIx0OFZ
 oiIVrtqqZKNlCGWWpmW4dA4RQj7vT+SmqgBjYjfZ7IxN/5oFI849v8An7J2HSDA2c+HZ
 gZtxIWKq4pVLCH8GeJlWtD+n7Jqtv6WUx2fyqZYcoFFFU+gwPMM0CBb/ktDQSlaeTZ2D
 y2VH7uG2xJQo2FKOLaoE6NT/BV9JJf81S+pxsnzzGsvZS0plktJcjlIeGiAahh1bF5NM
 WvFhDxtc+356KFraQLpKHq9kTvwWS1B9CuyOeU/Bv4K2hGM/ruMpMFW43hOVBK0UKoyJ
 27Dg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791128271; x=1791733071; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RcVUgNfznVI0SNePmkcCKBmBEyIQj+7JsvQtdgF8L8w=;
 b=GqIJBZqJI6hglFrCbSX2eOGd4Cy8fI8cBDgktp+6EKC8ChaZje5oRDmIHWhqm95jxZ
 Uw7dJN1HPYfg74MnHPn4EWAab6WqbB05duYXhOqD4d5h5NFBvw2SPJhcaYY0QYJr4IdQ
 95UkDRAcCfaAtVWb69eTCcQx6UpbLQjIqcZqNXk4dWf2qMCCQmmvnFxVQsjVTyV7xolC
 TH+2qy/kGIFFvXaNq0sacOYQGxfPSJniXl7UD2imyCMscgNHqLL/DBOLUg3a5OaoaGUZ
 E++8aH2ORq/KvG0YBIOAkaTX4abGW6yDwLCtK4J7zEi/TVqQv/jDJ/sM6P7MdeshSusZ
 N+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791128271; x=1791733071;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RcVUgNfznVI0SNePmkcCKBmBEyIQj+7JsvQtdgF8L8w=;
 b=r+EPkDtj5/c44VwJJLiJyQLR6+uaNd9HGLfsyXKwgcWyXSMyDWJ3QuwUQNtxpWa2uo
 p0NlVmRMOCuCAC1GuCMX5UJ0dwXltCLEqKEE2oSdhfv49vm92rvKtml1/zHBK8Z56yUC
 hkYjmibnt+veRpxOPS7tMBrrJMxSAnj2X0UJBpUs6gfrZ1QewGgtoN/mrZkfFIBSm1Gn
 hAF881C0iRQ5Nu1AnbNWiX+KaN1kPHZuXyQQektHL0gJ/1SFvDydkcrYKUaLzlYOpYil
 q9NmvXBChZk5IAPYB6X8miYDMSp23fN/9Av4ujdNXfYBa35JUNnPum8AorJ1yQGzPwmr
 y6Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2xti3/cji3+hNyq4RLCEM8gH2vXPMTDE+qySFi9Wsu6e9ULouA4QALcweWnRjMVPZd/xR98S3sjxD@nongnu.org
X-Gm-Message-State: AFq9FYI3LEnCA07EXXxYZuy+IutOaFfZtiej4DtwYaye4xp9WYpFObsh
 5IIBbgSe+nHV4dxVjXZ7kXGWQTimG2fPUKRCx8X7DuRyhIvOBJ6pPQw21uIbKt3XDTbpIyDWt8X
 mKhy/Ry5KsFD9J3lKSBBR4WownXZCdgI=
X-Gm-Gg: AYBFou0zQZbhQrLhPjnHbiNs3gaV3q3mqEAMOD1UdJ8rkQYxqVzxH/Tur/dU+vh8uk/
 jZ6NWHVopa9Fv96z7+A4HGnqp0JoHdzMwXgJP3sAHfPw43eDRRdUdEBfI40ovytxKkksBNxZw7B
 59SGMv6KJD5G2sGP64LqDk7GUfHBungS2tDm3ynD1o1xEvQmCOSeBxIq7dN+EySlIVb/MiZQ5/s
 U0MTHhCQWHAVTXobIOOPkDiUvtdXDbHQ/dKPo+PGVFNIR7U/n4fBa7EFbO8EvWqVPZ80PK48T2p
 E0NfjsaOoiSfbAMAWPmxFvDHySFO8mJbY9nmeQCOaDd0vYZ5kBwnYBfVISXpOxakBSmtMKggk1h
 p9wtqeYedoadY7H54ycJFLyslSLo=
X-Received: by 2002:a05:690c:10:b0:8ad:c78c:2555 with SMTP id
 00721157ae682-8ae951f3fc1mr15292367b3.24.1791128270908; Sun, 04 Oct 2026
 08:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261004151855.201300-1-tanchi25@mails.ucas.ac.cn>
In-Reply-To: <20261004151855.201300-1-tanchi25@mails.ucas.ac.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:37:39 +0800
X-Gm-Features: AclHuK-5lptRo7y_hBtVSt2FnOmlFGodLLy8ZefqpvUId3gQT3WUGntomTAkbCg
Message-ID: <CAEUhbmXi+d-Dfc-VtkmwxMU421DQ=eth0WGSPQa-p4Yp+_grPQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: fix entry leak with ioatc-limit=0
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sun, Oct 4, 2026 at 11:27=E2=80=AFPM Tan Chi <tanchi25@mails.ucas.ac.cn>=
 wrote:
>
> riscv_iommu_translate() allocates an IOATC entry before passing it to
> riscv_iommu_iot_update(). The update helper normally transfers ownership
> to the hash table.
>
> When ioatc-limit is zero, however, the helper returns without inserting o=
r
> freeing the entry. Every cacheable non-identity translation therefore lea=
ks
> one RISCVIOMMUEntry.
>
> Free the entry on the disabled-cache path so that
> riscv_iommu_iot_update() consistently consumes the entry passed to it.
>
> Fixes: 9d085a1c3cb2 ("hw/riscv/riscv-iommu: add Address Translation Cache=
 (IOATC)")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---
>  hw/riscv/riscv-iommu.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

