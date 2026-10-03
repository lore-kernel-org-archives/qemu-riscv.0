Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B135CA5FEC
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD1ON-0006xf-90; Sat, 03 Oct 2026 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1OK-0006x9-7r
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:11:12 -0400
Received: from mail-yx2-x16.google.com ([2607:f8b0:4864:41::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1OI-0002TG-GK
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:11:11 -0400
Received: by mail-yx2-x16.google.com with SMTP id
 00721157ae682-8abc87cbd93so2532287b3.1
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 08:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791040269; cv=none;
 d=google.com; s=arc-20260327;
 b=iWzy38iu74cy2OjIgqbTB0CI/0iXTUrr5/7ddR3KBeEBFFtBanqQiik1cyl/RNOkfF
 sHEkr/O8DdiP4gt54d2I6RkwjcfY7ot2217gNgs0Vd5zej/qmiqb/mHsAVmxmCzF3qbi
 2cmTjL8qE74g5R9kqzbuCyklRACCebOM8+irZ9tegabQlH/ibQdRzqT8t+gohwa5kolm
 Yk/nH5YYNO5OyZm9jpMXJ/187aP3DaxdnbR6umfUvL0l3+W/GdOpxqLU57o4ahhH7nfS
 9Fu3FG7SgdM8IV9wns1nellpby7kfg20RhnQuUfuNMoy7/DOF4mwlmxbq7kBLev5ow4t
 JUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pgZic5wRNJzwWhfBBT7pKQjY+WX1ujt++/6Zl5k789Y=;
 fh=BeAZDMFgtmqqFu6QOz02iDZo2qVAW2yxdNCGqdOfINM=;
 b=l3JXDMv4zfSTYNe/Wzuss779AfLwCqxgLwcXssBS7nUAr2LNtfDbXQ+GaosTppDzmu
 TeaFHxiRA+8VA7ZnBiBJpiWdeDq+6ZvkKnSY/ro2y07C+chwoVeRJX9oJX4hZ2fQbtq8
 gO/qZ8IWFrDcYEaIy/xTPm7dsWI0B6QBHiPVR3ntrH8AIlHWiD2Hv/HWpWXg95UZi2ad
 B8EjPWTxGfiQPU2HusVnxtm2slzNqmEYrLmyOTuR2wE7uNBBs1kzZIHf0iWAOPB8rFSg
 rRosoNuvxxVRwipCpHZT+OXt6s9oVSPOV2ydjea5QRJJrQIZIl4NdOwYqIueUKvpwCBC
 16kA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791040269; x=1791645069; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pgZic5wRNJzwWhfBBT7pKQjY+WX1ujt++/6Zl5k789Y=;
 b=nr8YfvZ5C5PUtAOGZI5XEOMCmobMBNNyCbeIbnLwQRLeaX39reHORxUF6MGEOpFGt8
 MxQSyUADvmu5EDBcPmGLlODPxwOG43QqJrGxBx+bFEBcizPz4Ko6xo0p4bmwEUWfxZh+
 7eDK0qxMmH03A24ZCe13RhOta4Dl5QiPpIXrofzQwtwAVUBmvO7f9Wj7s9fhbFSZdJj+
 xe7XwyB0MuCRFXLJy+zXsLpVkDglcvqXCdR0XLLHmXUXaKYhAIKUqtrXiEbeDZyIcJKj
 hHcom5+yYHkHWkkDNceVwybQPkxHRh3Zj+NFw5v3u0qw5Qmh+nQ1cJ0/u8u6Ovp97oEo
 sJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791040269; x=1791645069;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pgZic5wRNJzwWhfBBT7pKQjY+WX1ujt++/6Zl5k789Y=;
 b=jt0V0YmMtCX44mwj8r01rxR7ZLXazZnOWu6gjm/QtP2LdSl7dJI7pKGFNzMbUL9+hI
 58JaKjWrHPnEJT+9hGqpZw1YaAeMHFL+oBIl+0Xi1gaC8N1ZkiBPmEFUrv/e0GR811lB
 5z1I/cpeRY2LT2j0s4czwkQEn/W91MJBIiRvCSSIrDAud3zWeVGuck9TBvU/vSHdeYFe
 bEg5vv6zUuULV3ojJdyfh7/vBq4OM1X+4zepV3GEyqoAWj9zvn0J9yXa3bI7tGk4259v
 Al3kkALWgDZ3eDnB2zDTb+pdOIMDHshGPxsPlI2Hptp0NL3UXs8QC0zBOrEwq0jMuC6R
 oBfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwBEkzFaA4pVXKUEAzKiALdaPU+XfmCWdlZt5YQa2dSQIFhtpXvAbmDLIB78rqm7Omik3dK4M1na8e8@nongnu.org
X-Gm-Message-State: AFq9FYKAIY4udZE8z3AoAb0Ejebo/7cCgF/QExRis5eklHyBtosbWGdM
 gQxTmUSqLkUiE+Wmv6N5S524pkOK2RTi794lSrOQ4XGSPZM0/kT9CLa9gbRVbpUOtQ1sRM7pu+2
 MHnigtcu1Kp9z2tJvZXBpI+4KA5ChQ2Y=
X-Gm-Gg: AYBFou2fguQbQO+wbNlL43BvS9KkeeEh781ZVltLeVrhGMhKMet3rPIy2/IPbtWSFhz
 IuA2hsElqlfH8jYqg4kQLCVBI0Cdy543pVEQV6aYxMS1H8dIPTV2NSWS5zFopJ3RS2XZdkYnqYF
 aI0J65LbLuveZgQK40/r6fiSMCEILVB5UiP1JepTcOsluO2mqEcrcALqMsoCL1t8iv1tcFbSOdw
 Ms++IMwqhMrvqVrLeauWmEi9uIHrULwD0D/Xdeam5ohCyGNfGvByHNjINJYJwl3PFIUdU+oOsNA
 Vo/LBkSTAChzOB3+44RCO87oaYxDD/FfxQUvk0c++Fs4wYOHWJq1BPDQksDtjF8Zwl/3ODJFivK
 q8SGDRLOJoyfjlw==
X-Received: by 2002:a05:690c:f04:b0:8ae:8d28:77df with SMTP id
 00721157ae682-8ae8d2881c1mr17682077b3.9.1791040269239; Sat, 03 Oct 2026
 08:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-20-bin.meng@processmission.com>
 <20260930-livestock-stylist-cedacf269035@wendy>
In-Reply-To: <20260930-livestock-stylist-cedacf269035@wendy>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 23:10:55 +0800
X-Gm-Features: AclHuK8HvGpKKWBC8opOUTDxa0ddWckjUda70l_nHNNDD0yYIPCBaYJxLyr7PRk
Message-ID: <CAEUhbmVDNceBq0qBAbcyQPv1LuxL0=4MUpU5PcBmyXwtHm+j=A@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] hw/riscv: pfsoc: Fix Icicle Kit hart count at
 five
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::16;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x16.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Sep 30, 2026 at 5:35=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> On Fri, Sep 04, 2026 at 11:57:38PM +0800, Bin Meng wrote:
> > The Icicle Kit always contains one E51 management hart and four U54
> > application harts. The model currently accepts two to five harts and
> > defaults to two, allowing configurations that cannot match the board.
>
> Updating the default to 5 makes sense, stops accidentally trying to boot
> something expecting 5 CPUs and getting only 2. But why the change to the
> minimum? If someone intentionally wants to have only 1 u54, why prevent
> that?
>

Will drop the minimum change in v3.

> >
> > Set the minimum and default CPU counts to the five-hart maximum.
> > Update the documentation to state that other hart counts are rejected.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > Reviewed-by: Chao Liu <chao.liu@processmission.com>
> > ---
> >
> > (no changes since v1)
> >
> >  docs/system/riscv/microchip-icicle-kit.rst | 1 +
> >  hw/riscv/microchip_pfsoc.c                 | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >

Regards,
Bin

