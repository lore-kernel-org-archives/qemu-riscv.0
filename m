Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7EEC47074
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 00:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMdkP-0008J1-FM; Sun, 07 Jan 2024 19:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdkM-0008Ii-Os; Sun, 07 Jan 2024 19:44:06 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rMdkL-0003O5-0g; Sun, 07 Jan 2024 19:44:06 -0500
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7cc705bbb2eso335305241.1; 
 Sun, 07 Jan 2024 16:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704674643; x=1705279443; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwSsmQ9gvmKwvTWHmlo6xE9WpD5uBTuAgmAET4zgGyw=;
 b=fUD60zgp6dp6B7rg3FJIKezZ6941cW69bjq9PZqylqKzucyG/Q4lOY4N4fWZO6B7SK
 9mUU7LYzYoWBs5C7vtl+udJU0gxilOEMeq6txxIBrPvNunpQk4JcmYZmGUKmhXM0laUq
 R8+ncXyVViJwbD29FMk4Rc/d21t7PPee/YLv/ndX3q1jrHYZWC/Fa/sVhbInkUMvwNKm
 E3O89AXSgzfcgAfLolU/r843Aftwuy4El/QmGVIbDrbb0xecaVuLfmgoQHNYyJbE4hjy
 0dD+MGFJkFxuE+/eDTDtswF7DvC3c5eZEipPc7vsv13yfj0MwtkwbqQ8V9G9M1fNnwa2
 G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704674643; x=1705279443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwSsmQ9gvmKwvTWHmlo6xE9WpD5uBTuAgmAET4zgGyw=;
 b=Tvwg0YfBf5ld33MR1uqttzvXhKAI0/ck0yr8ufC05HA4OfdXokRtavCtwqy5qdOyXC
 eTtk9cQ+r5XV4KH5hl9guQwiwrqb0OBCZIqMf1MeZOX9T1DTPe0ifPyG44u/9xCaVz5f
 I1DaDwH0UV7NeGFTbzojRu7oOdvUSt5Snudpnwx7eMN2L3cvowqHuJmmrvz1EBq76Hhu
 rMGwwkZf98T9+Eqt4268yBLQ9ZFYFB5tktrK5p1zQi/DUR0d7Vx8O60ukIhKCue8PO9u
 P/SS0Zb7xyAOW9D8IBgb962yEbwl9oKXXo2omU9YN/LSLOQN2H/dy0ysKkvYHeBrJA2R
 jGPQ==
X-Gm-Message-State: AOJu0Ywvt7R/E6w7GaVK6MO8GjP+59LTlkRW+/hp/JB+rR5VAphyRHB2
 oTeCbnAIU5DJVBb8ZSGnTvw3TsVDHXgcpcRSmpKkg9VX
X-Google-Smtp-Source: AGHT+IFn4KDFfdkpB2jihN2rkUo3PVJJ0Q/X0a9heLUiZnQ14F21rA2NvOZDwaNPAdKA4cXnJhEdKiwwti9Jssxq1Rs=
X-Received: by 2002:a05:6102:2b8d:b0:467:ae15:4d35 with SMTP id
 ib13-20020a0561022b8d00b00467ae154d35mr1369088vsb.8.1704674643416; Sun, 07
 Jan 2024 16:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20231220153205.11072-1-ivan.klokov@syntacore.com>
In-Reply-To: <20231220153205.11072-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Jan 2024 10:43:37 +1000
Message-ID: <CAKmqyKO8W6PExfMGZ-UXrTVfMdwhq2wnMVO-YAMmW_1V-RAX6A@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: pmp: Ignore writes when RW=01 and MML=0
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Thu, Dec 21, 2023 at 1:32=E2=80=AFAM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> This patch changes behavior on writing RW=3D01 to pmpcfg with MML=3D0.
> RWX filed is form of collective WARL with the combination of
> pmpcfg.RW=3D01 remains reserved for future standard use.
>
> According to definition of WARL writing the CSR has no other side
> effect. But current implementation change architectural state and
> change system behavior. After writing we will get unreadable-unwriteble
> region regardless on the previous state.
>
> On the other side WARL said that we should read legal value and nothing
> says about what we should write. Current behavior change system state
> regardless of whether we read this register or not.
>
> Fixes: ac66f2f0 ("target/riscv: pmp: Ignore writes when RW=3D01")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 162e88a90a..c0b814699e 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -126,7 +126,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
>              /* If !mseccfg.MML then ignore writes with encoding RW=3D01 =
*/
>              if ((val & PMP_WRITE) && !(val & PMP_READ) &&
>                  !MSECCFG_MML_ISSET(env)) {
> -                val &=3D ~(PMP_WRITE | PMP_READ);
> +                return false;
>              }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule_addr(env, pmp_index);
> --
> 2.34.1
>
>

