Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396DBCCD1BB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 12:00:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBXUv-00031F-Lh; Wed, 22 Oct 2025 07:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBXUt-00030r-Ja
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 07:59:19 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBXUq-0004nu-QB
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 07:59:19 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7847ee5f59dso60118317b3.2
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761134355; x=1761739155; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2aiacsTM+Apf4BjyzIj1WdPyZCDKsMwDRWrneL/bu0I=;
 b=nlH+xb7VM69yoLm85L2EMzL5+SwQXe3+b0TJ/NfiOoAJSL0WcgeV9xx0Sh1tW4n6f0
 zjJ468LuWt+wDqt44z+K9T5OFgBAuEWZOM8O1NwkECCiBtKeaY4drXAuKuxPf7v4Y8r4
 h9396zuPdZP34CDk3yBeDRCh17wdzCpQrgCb0LRTFFViXWjJ+sbjqfM8JH4CNqoAQCts
 djE9uIZfb2es/qiiq64Hq0l7fWaL2g/U+45RrNX6RKbiKOsb2C0AmL3PiYzJ9vz4ag2B
 FlRpAcyrIENzwh+8Nh3ONJiqnuD+sHmFuwLCqXVf0JHPW5o/SR5BHyAmLAtT/X1nvPv+
 xQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761134355; x=1761739155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2aiacsTM+Apf4BjyzIj1WdPyZCDKsMwDRWrneL/bu0I=;
 b=dzrkX/R6aPNxstxz1J+GwKQFssXYonG1Ah012SxSLAV4S0xeUauECFO9zWFC/0BuU2
 z4Bd+myfGerJZXFwDQeTW7pKSh10zZEF9/JxoKcXBoTWmjayGdFQFPeh87syxk8ryG/L
 ZItaX23NRVvlygKUJJf/VXM3irOcdcfz+o9y7+Bs815XPut1eB0HkvWX05IAIzVMLFTp
 /sibPCJ81LW8AA8IVW64OCciLe9WxqPAvI638CSSAK4tJob60wLuZW6maZSqsc5wZmck
 oD5QHUhJFFQkoNWt5oCI5xmxtJ2vYP0PIdXPjGXQrNzhepuRW0s9VopOMe8cHFRoMwve
 OM3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHX7B7GJGV3HC0A4nGvADbR5u41n1ss1GLFDtKgdPi5dC07a+rFWgUXJYPS6lFyfOqjLsxeYlUeXDh@nongnu.org
X-Gm-Message-State: AOJu0YyWuk3mFmNLzAnOGsfLsBh1mqf4O2xexj4Dt5pqa/V2rn2DluBx
 GwJnBBN5TdtFIGnfb1nnRDJp3a7h9ze/bt12OX/5uR5CGJ8U01lFF/4x++9l8DVZW2Q4aNsvhcm
 BJ5T88/wquFqFZRd51XePgu2rogHviTBXBbLr3W/kzQ==
X-Gm-Gg: ASbGncvpBIJReSBDbHfC7aNxi0ZswjKrSm9/6x3n7RLJ4IJS+rhLkaSsm4LhPHmIJQC
 5dVvOajrrNXRf3Y+CVOH8PjnSIDlMHaVlVxzb1pF8+I1g0Yib/70wiO5RsI1E86Lwel8srDVkZa
 li0OoKzrt/v2T0mcWTbUUJRlBgy+W9wWT4Ix19H0t/0gqwB5tp4cXmBM3Nvmd6F2aK5BedkLcsT
 l/wlDy3yHN6s3lha/OCY3WoZGKs9UXX8RDMOE558XKHLosGqRDrCx/HIkQ8F+V2+dLuAA9D
X-Google-Smtp-Source: AGHT+IHXZ8YWsJBzkI8UC6K9HZJFMok/S84yJZhKkLdcKIOoiJHZeWs3DfvW81QKSYAyEmZjMxkSSn8qriQqMX5BFw0=
X-Received: by 2002:a05:690e:2064:b0:636:d63e:5c1f with SMTP id
 956f58d0204a3-63e16258be5mr12553966d50.49.1761134355354; Wed, 22 Oct 2025
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251022110524.483588-1-dbarboza@ventanamicro.com>
In-Reply-To: <20251022110524.483588-1-dbarboza@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Oct 2025 12:59:03 +0100
X-Gm-Features: AS18NWCLvyNgxMuTbNH9vKfCExtRNyycgbO6gGLN8hBcfCtppHTm3JEQtePvXZU
Message-ID: <CAFEAcA-gF4himAj7k03cES2-USbE-xs7f5LZEPQaCqHhDieiEA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/riscv-qmp-cmds.c: coverity-related fixes
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 22 Oct 2025 at 12:05, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Coverity CID 1641401 reports that, in reg_is_ulong_integer(), we're
> dereferencing a NULL pointer in "reg1" when using it in strcasecmp()
> call. A similar case is reported with CID 1641393.
>
> In theory that will never happen - it's guaranteed that both "reg1" and
> "reg2" is non-NULL because we're retrieving them in compile-time from
> static arrays. Coverity doesn't know that though.
>
> To make Coverity happier and add a bit more clarity in the code,
> g_assert() each token to make it clear that those 2 values aren't
> supposed to be NULL ever. Do that in both reg_is_ulong_integer() and
> reg_is_u64_fpu().
>
> We're also taking the opportunity to implement suggestions made by Peter
> in [1] in both functions:
>
> - use g_strsplit() instead of strtok();
> - use g_ascii_strcasecmp() instead of strcasecmp().
>
> [1] https://lore.kernel.org/qemu-devel/CAFEAcA_y4bwd9GANbXnpTy2mv80Vg_jp+A-VkQS5V6f0+BFRAA@mail.gmail.com/
>
> Coverity: CID 1641393, 1641401
> Fixes: e06d209aa6 ("target/riscv: implement MonitorDef HMP API")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/riscv-qmp-cmds.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
> index c499f9b9a7..7bde7090ab 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -273,12 +273,13 @@ static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
>      }
>
>      for (int i = 0; i < 32; i++) {
> -        g_autofree char *reg_name = g_strdup(reg_names[i]);
> -        char *reg1 = strtok(reg_name, "/");
> -        char *reg2 = strtok(NULL, "/");
> +        g_autofree char **reg_name = g_strsplit(reg_names[i], "/", 2);

g_autofree frees with g_free(), which isn't the right thing for
freeing an array of pointers. To do autofree here we need

 g_auto(GStrv) reg_name = g_strsplit(...);

(GStrv is the glib type for gchar**; the headers give it an
auto-free mechanism that calls g_strfreev().)

thanks
-- PMM

