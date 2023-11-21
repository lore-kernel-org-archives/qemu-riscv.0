Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DFDC54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 04:00:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Hvs-0004JZ-Fl; Mon, 20 Nov 2023 23:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hvp-0004IO-MM; Mon, 20 Nov 2023 23:00:13 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hvo-0002Jl-2T; Mon, 20 Nov 2023 23:00:13 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7b9c8706fc1so1881204241.0; 
 Mon, 20 Nov 2023 20:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700539210; x=1701144010; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AbIeXOiHU9CKTbjTLphB/Ft0S2Lxds3IsGzKHJP0TE=;
 b=CCIpq2g3wEWTt+mMf+SglWLAMKpYz3VDSiEBdBBXrAOh1o3md9/7ThA8NDBDzPJm7z
 6rnsk+KQk4krp46r9fsUnB/H7UBVSfaPB6gSm+HrNqDXIMSzWSvBFjFCkfP1M1bSAMYH
 X37x/IzsDoJzqjfDQ8ofvdMBHbwwq7/A0WB/3ybS/Nceecyc0Lf8oO2OexhnYMrmHAoS
 czXTRIX3t6EUNZZWkR1d9oUBgIxxOFagb2u8hoEq7y6b6/ASTGp++Qjgb/Sbn4qoT5Tx
 ZC5VfoGDNUlt53lOJlqrHo5deQLHW79LktlaerFJT/oCjOSrbqdjxOUNBS0pUeb7Phuq
 2Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700539210; x=1701144010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AbIeXOiHU9CKTbjTLphB/Ft0S2Lxds3IsGzKHJP0TE=;
 b=saQkaUcg1yTTDODoIzQcFf1GSyaWC1CpBWUYu/vgfbZhrcKUgrjyHowkvcAAq5e8Bk
 broaTi/uyhZSAlDfMg28dlrsfqFh6haZWbQfJ3Sdxq1I6YJA7ACAZVGuiZOZf2nrqzTi
 nzok33eXB+coQDyxk9lEp2mOEa4NfniFBmerVvLj2z7ZdX6mhJOfLbVORRMcbSosiqVB
 nPnny2dQnANFarChyvql6nSUdwK6KpgA/gbHmK/8LWKLCbh+oQID3inLlMvHpat22fYb
 2eyIiMT3Mn8n4ClUznmi07Sa0Arq15t57rEc+b1psIbM898k6w80+VXuA9if0qSAO19W
 +g2Q==
X-Gm-Message-State: AOJu0YzpLu7aZPLwXzGthshg8E7pdufayoF2oDXbTpMzuy8snxoGEOaE
 1ZQTZq3CZbZGMFencyQWi1BLfsx4tnXtSerayNU=
X-Google-Smtp-Source: AGHT+IGMCesZuRQQjpXbGpSfGp/ZAzPRwaYufv+BCXC6LaqEb+kKEKiwWRXeSggV7RAqbmwho6G23U/xYajs2vEQNEs=
X-Received: by 2002:a05:6102:38d3:b0:462:ad95:e6b3 with SMTP id
 k19-20020a05610238d300b00462ad95e6b3mr2995450vst.30.1700539210339; Mon, 20
 Nov 2023 20:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20231117082840.55705-1-rcardenas.rod@gmail.com>
In-Reply-To: <20231117082840.55705-1-rcardenas.rod@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 13:59:43 +1000
Message-ID: <CAKmqyKPha=CnU4fna+FXLHqzdvUsPpw8r7uoxUHerJ88av7=dQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix SiFive E CLINT clock frequency
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcw==?= <rcardenas.rod@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Fri, Nov 17, 2023 at 6:31=E2=80=AFPM Rom=C3=A1n C=C3=A1rdenas <rcardenas=
.rod@gmail.com> wrote:
>
> If you check the manual of SiFive E310 (https://cdn.sparkfun.com/assets/7=
/f/0/2/7/fe310-g002-manual-v19p05.pdf),
> you can see in Figure 1 that the CLINT is connected to the real time cloc=
k, which also feeds the AON peripheral (they share the same clock).
> In page 43, the docs also say that the timer registers of the CLINT count=
 ticks from the rtcclk.
>
> I am currently playing with bare metal applications both in QEMU and a ph=
ysical SiFive E310 board and
> I confirm that the CLINT clock in the physical board runs at 32.768 kHz.
> In QEMU, the same app produces a completely different outcome, as sometim=
es a new CLINT interrupt is triggered before finishing other tasks.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1978
>
> Signed-off-by: Rom=C3=A1n C=C3=A1rdenas <rcardenas.rod@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 0d37adc542..87d9602383 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
>              RISCV_ACLINT_SWI_SIZE,
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> +        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
>      /* AON */
> --
> 2.39.3 (Apple Git-145)
>
>

