Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B161C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 02:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNleI-0002Ml-S8; Sun, 23 Jul 2023 22:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNleG-0002MT-Mg; Sun, 23 Jul 2023 22:50:12 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNleF-0007Ez-8l; Sun, 23 Jul 2023 22:50:12 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-79a00f74a92so672004241.3; 
 Sun, 23 Jul 2023 19:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690167009; x=1690771809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1CUbTyvvUQuhT4x+j6Z8CbaXYC0AFPaK1fi3NNpsDv4=;
 b=lirQpIklRdCW/pepplidPBqzzZA8uoCywJJSNr3CVFkxPPOkYnYK0rUEklxgNX22FC
 lTz29sz4Rdsfejjgy1LME3DiRynGUPqWXX41D9mRNUk9SyUt+uf3lCj/KPPGTCthEkqB
 HW/DNkun2aKlkz5iFT/o5fgfoKLebRbwJNWRXxNWbkrmmbH+1wVR39CKF4KHGe7r+xIf
 glEqZPHTkz9Bl4AqkLFXi4wpUp3vbIiPAmKO2zaNjMXdMkPnZEnSSx9FhPT4Ov/CrNlA
 bTULkzluQ5GFSmeoXbJ11o+2viLb/QV2I9tpEjg+e0R4S6OFVsRs5yqSP1V4pGSLOF5b
 pckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690167009; x=1690771809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1CUbTyvvUQuhT4x+j6Z8CbaXYC0AFPaK1fi3NNpsDv4=;
 b=H0Mg+eZgBGitPkNiFmssDVS54NoMqf/62gjAB/r7wcAN187CJtIX4X67B0+clsSriI
 k3Hh3gSG06VWfO0qgyCEWiaP/Z3fN3IIrUCLNP3loohoSvVbCRq39UdTDVlQF1eAPGTE
 0mpV33WzBz5MxT85po6U7UQbQU3elYt5IsnY4/VOrQvewyYslvW2mmjXnr/N+swvlOXC
 WYGOa02P/gymRbEly8Y96cV4U4fCWw0dQF9BQ/grqT259WAvOpFKjeyIaE6TDNPca09S
 OZbd2SRgwADOXSmO+kfRFZuiIAzJw6DYoNXOH7qQql3+kciB0HIo0Z23IrcMA1L4AfBG
 aJCQ==
X-Gm-Message-State: ABy/qLbRQGY41E+hdbgK5NDaSn5223UN0oYptR6wARvdZ6vNmGgANxXo
 3h1duOxSK9YLoh4n0praEgSjV9n2Le9oJ8NVdkM=
X-Google-Smtp-Source: APBJJlG8EkFMBfUtUZP5UiuT9M5AYaI0I4OXR5fr/rE/tS1zWCmIg3hH10w28HCr82AVgMz3MkqL0jxq+I0Mz8Tpejc=
X-Received: by 2002:a67:fe15:0:b0:440:a760:dc9d with SMTP id
 l21-20020a67fe15000000b00440a760dc9dmr2431618vsr.16.1690167008771; Sun, 23
 Jul 2023 19:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230720132424.371132-1-dbarboza@ventanamicro.com>
 <20230720132424.371132-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230720132424.371132-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 12:49:42 +1000
Message-ID: <CAKmqyKNMoYyw3L-yNr_LM196MBj_iNYho2cdmUz+=BAcX6OzdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/cpu.c: add smepmp isa string
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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

On Thu, Jul 20, 2023 at 11:26=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The cpu->cfg.epmp extension is still experimental, but it already has a
> 'smepmp' riscv,isa string. Add it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d64ac07558..8c9acadd3b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -130,6 +130,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, epmp),
>      ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>      ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> --
> 2.41.0
>
>

