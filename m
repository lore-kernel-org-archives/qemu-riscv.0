Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE711C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuQE6-0008EV-8K; Thu, 13 Aug 2026 03:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuQDt-0007vO-5F
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 03:51:34 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuQDr-0005vk-Mk
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 03:51:32 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-81ed000b507so18607387b3.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 00:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786607490; cv=none;
 d=google.com; s=arc-20260327;
 b=R8tmN/8S3rIJ++2+UkR/ezK1mroIZlrFpx6qpVMsJol3DGWJ/o09YllFgEmZ4Ybqjh
 AEGwutUhOyUCo8t2o+Oac/sOGF8YF5/ajIvEHHtdP4/vZYpT5SgIj/iPC2bM2EWvw8/b
 uJzYTuiCjmj14o7XMpI/Gk0b2T2z/s98Thz4mWMXbUtg2MA1DVLyYZlo2DlNOiFeR3Qy
 G8ygBLuimfvzlq7mjy/l6FM5jAgmfcaHr1G+WJZvRvfGlzGf8eGx71jfTX7SytQ2PL5j
 26kPhe4iey+7qy1R8ZjXfIR5a7QRodPQ08ZtxSuvoBM3nnXKzN7iHfpiYASNwax3Royv
 2PDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zLY6XVyEJwjjdlR9796icQpjJYNCoOvvo7uxpuoaiRU=;
 fh=QiSCzHveV+LVS9ft+nF9RXoGS98uJwZ43CgH4dhZklU=;
 b=hQOLg89UEYQXODXJxEUpeJzf1ya9PXyM6sqJrBUoZc6uZ3zr2ybeuuyx6TuWgd2ins
 rfr7kesGiPf/CzfYajqE/TO40Lw7xhyPnimzahP+PaVIzOHiBkVj26SN11UR4LzS57zS
 /eXLRJlpdUGMu4LbWjgEMthtD9pxKgyf1+1PHZZ8oEZNlL/0jOvfmg2d/JZoqLHULFOg
 iU98h1auCQbbHe0JhG4SGwZouL1NpHhTR/NpqflCDlTXHxKhdb6QuTjOiNnj66cFLoe1
 LN3M2ffjnXg/RinT/egofrMg+hRx8DmWaGysec44HZlvg43JWpE4ZsmMvdK1OpAXV38Q
 4b8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786607490; x=1787212290; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zLY6XVyEJwjjdlR9796icQpjJYNCoOvvo7uxpuoaiRU=;
 b=kUTfvxejVNDXfNCl0YZnpr/zwEPapM1tpr1nAvXoqOFZHBqHMrD53tRzQlBaoHkZvn
 X+kLGrESC9Q6cZ6MducxYeU+q+W8eDGQJVOwb5AgXA/h4aPrgQy0VfiOY682HB/crVyR
 grzDVvz5Wkn5hH3HxnPQjylLO6sSA1Ja4pJ3WfkW5M8MAZ0ncOQxIoFsuagK5J6D+3Ka
 5VJpEBR5+LGoLcCqINDrRwSkRniIZL/sxMW5+wo4KHtjh6jzGTCeQxbZxf1ANZnpRwtL
 LypBpNpL1Jwajs24hlPBZPIc/TDdhM0wT07yfKBckPpHo8pNMSEm6PAA8GNSPsI3axNm
 H2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786607490; x=1787212290;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zLY6XVyEJwjjdlR9796icQpjJYNCoOvvo7uxpuoaiRU=;
 b=VCV2eyTDpp0hpqx3fb2GqQNM9J+EjU/pd0kFmVyR8VrkQy6jqek/iZrFSeBPYWoAuN
 40Kf+BcftR8WBxeDhBZr27/kQ/Pyu7GDR2pMDyO2JT7+wGaKX42D92TnGG8vTu56Z2dH
 65JmE/TwoYU/vgC6GuKAYYMRXMCxvkLJEUnNKpq1hckGyQuaCYVkH85XszY0SvESwmIS
 5vqsujyLjvUVLYAURC2hCcAKLLIarUD3+ad/lb3xWplwWsJshkCf5Rxh30GeTclYGtjD
 bBBu8RV9jVj7wm5GNJtapcUY6TZAu4aYYzxSHv5TgwIBWye0amATOdedJyEnwD09YnoL
 pp5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RogjByFgHyj4EbZAo+9Co/bjy65CIfcP8iLYo0hxzPGhTgaWUeCodwJ/2XkfNBeN8SqEkjowtVJA2Bp@nongnu.org
X-Gm-Message-State: AOJu0YyXFnNZ6X6hk1/aAc9qaG1GulmFaGLUy5G0HJDfUdWhc0L/PH3o
 54yGbGBPl9hnDLXh8Gi1GoJS7jwDgqmvCAtqNr55D8ZM7uSxR/KxnZgoPRDQU0XpF7KSuV75iR7
 S5XYUtB8KSpv+Mu2M5GAZjpa+6/PZZE4=
X-Gm-Gg: AR+sD1168J4J4Ds1ij4N02tf46IkGKTGpSzIeC4ANNJlrg+8UBRAGq9ZDa+4lH4RRLT
 SDn84GRiR5WjOziikCwpPrt5fpgqikEchW6cJKRUh9KoE2FNjfgeAZvAr/jxUt3Rb404kqRVC5u
 4v39R/uVb4+m3f9RwFGPu0z7pg+4VIlIv+E9TUxyKzC8iYWUD27V62r8sSY6vTUg8IJg2JU2MJW
 lRsF8eReOW9lOWE4jqgt47L8ErtpGMtdrsGkv76IY+nJ4xCcq7hUa7LnpZU5KdLGYUbc6KyfpIQ
 MqZzD7W178nBSmaprQX9c9AHB4p0TWk14T74lQ0i6Nz7dNroEtpc
X-Received: by 2002:a05:690c:31a:b0:81e:c436:c530 with SMTP id
 00721157ae682-834723c8b1dmr23257777b3.14.1786607489888; Thu, 13 Aug 2026
 00:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784022244.git.flamboyant.h.01@gmail.com>
 <42d005d6e530e2cf2c7df8634e8b82c0f77d1702.1784022244.git.flamboyant.h.01@gmail.com>
 <an0wcQahXAB6UCCB@ChaodeMacBook-Pro.local>
In-Reply-To: <an0wcQahXAB6UCCB@ChaodeMacBook-Pro.local>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Thu, 13 Aug 2026 15:51:17 +0800
X-Gm-Features: AUfX_mzrdsTYQgtzlU-Ct7QniI_NzOG1UNbuZhVOcmE1BGbAfpF2y1yOWx5mPdk
Message-ID: <CAAW0U4atycRToaPbd8tRo1KoNUe54zLdi_72oCFqYHv8E81=2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/misc/k230_iomux: add Kendryte K230 IOMUX model
To: Chao Liu <chao.liu@processmission.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, caojunze424@gmail.com, 
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi
Chao Liu <chao.liu@processmission.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8813=
=E6=97=A5=E5=91=A8=E5=9B=9B 11:18=E5=86=99=E9=81=93=EF=BC=9A
>
> According to the K230 Manual, Section 12.9.2.2, IOMUX register bit 31 (DI=
)
> is a read-only field described as =E2=80=9CInput data from outside the Ch=
ip to the PAD=E2=80=9D:
>
>   > bits: 31
>   > Field Name: DI
>   > Access: RO
>   > Field Description: Input data from outside the Chip to the PAD
>
> We don't need to simulate external input here, but I suggest adding a
> comment explaining that this is set to zero.
>
> I checked the K230 SDK and there are no dependencies on this part,
> but from the standpoint of modeling completeness, it's worth noting.
Hi Junze, Alistair, and Chao,

Thank you very much for the reviews. The suggestions are very helpful.
I will address them in v3.

Thanks,
Kangjie

