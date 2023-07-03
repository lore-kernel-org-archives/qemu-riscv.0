Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8461EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGAOU-0005tg-Gn; Sun, 02 Jul 2023 23:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qGAOS-0005su-5Y; Sun, 02 Jul 2023 23:38:28 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qGAOQ-0006MW-NV; Sun, 02 Jul 2023 23:38:27 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-440b9d60606so1264361137.1; 
 Sun, 02 Jul 2023 20:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688355504; x=1690947504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLeayLSQcxUoMKZa1AlptIFmx02jC8VrUB4fcVx+R+U=;
 b=gmHIYzSbO3o7447/my2vT2H8g5K05wSBCmaaqNUpEvryiUMFjMaHu4G3gw13rZVwJ7
 MAujWHUYX8E2RAoQbaF9PEtvHLkaW67tk5tT3BZl/Fs7nfFrYIYtGxoEuzBsY4xJWy57
 +MDoK6KvISidbVXcCWHDA9vgS/I81U9lTp55yGmFjpoGhESr1OcpKwhsRxFAUVyNNKOT
 9bd7ympQ3uDJAguIQpaY0nsC/PmosIJ3krBe4thE6CqpnnKbY8SnAtJWFZxNFESfnG47
 rDIzrANAifC/fx+c9LunioJW2UnAH/zi5XhgBEG3LkHdWctoyCWsG5hPQH/whfWUa6Lb
 7SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688355504; x=1690947504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLeayLSQcxUoMKZa1AlptIFmx02jC8VrUB4fcVx+R+U=;
 b=gw4siOKfBHfEssxGwg4Ik4Fnr/ahQj2yNod/C2oh1/tE/VBDLd/NBdVIjmpcT9B6yr
 oMXbMakZfmCnWGK2mSCV8PPtGw/Uoot1o4fmeQqEjUf45k1Kr7LXa6u4lI68ynItzuY0
 PRqPvGF5i9OkUTlX6XFnsv35t4gc1KCRgJVawv/f8EWsDyRHzjwJ10x2ZlMBixrLqwkz
 TBj0mgLrMBlZCQ4ruNWsrtdTFG+cxpyG3NjMMyZB7lzuWNtPjKrFDIwOl4gExUGEzCpF
 d4uV1xGLL7E1SeccfWW7Ldw+1Lg2m3BiUI6LzSBOrni3bByduTEE3jR8VXBA2Otu+j/X
 wtCQ==
X-Gm-Message-State: ABy/qLYeBYkMjTB1Y+tvgNk0i4ZygOacSl6HmlNVwuzz/f59mL0qR/v+
 KkYaxW0a0LsRoJDkf7gHwdFO6xxTK63qKIdaf6I=
X-Google-Smtp-Source: APBJJlGW3PBnQh2zt9lcgLM91zgpkOgVX4gUeBf74jwQWXdfDUOUGMJpmGd0wu1HjkoMdftAI+ztDVfFyqM+HUCGhzM=
X-Received: by 2002:a05:6102:21b:b0:443:6457:10e with SMTP id
 z27-20020a056102021b00b004436457010emr4272433vsp.7.1688355504439; Sun, 02 Jul
 2023 20:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230627074915.7686-1-jason.chien@sifive.com>
In-Reply-To: <20230627074915.7686-1-jason.chien@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 13:37:58 +1000
Message-ID: <CAKmqyKP2VmHVO5tWRMa_CJjYCr+zvd64JBSrssGRCXwx_vzwjA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set the correct exception for implict
 G-stage translation fail
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 27, 2023 at 11:32=E2=80=AFPM Jason Chien <jason.chien@sifive.co=
m> wrote:
>
> The privileged spec states:
> For a memory access made to support VS-stage address translation (such as
> to read/write a VS-level page table), permissions are checked as though
> for a load or store, not for the original access type. However, any
> exception is always reported for the original access type (instruction,
> load, or store/AMO).
>
> The current implementation converts the access type to LOAD if implicit
> G-stage translation fails which results in only reporting "Load guest-pag=
e
> fault". This commit removes the convertion of access type, so the reporte=
d
> exception conforms to the spec.
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a944f25694..ff2a1469dc 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1277,7 +1277,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>          if (ret =3D=3D TRANSLATE_G_STAGE_FAIL) {
>              first_stage_error =3D false;
>              two_stage_indirect_error =3D true;
> -            access_type =3D MMU_DATA_LOAD;
>          }
>
>          qemu_log_mask(CPU_LOG_MMU,
> --
> 2.17.1
>
>

