Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3B7A-0001aT-9O
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jun 2022 02:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B71-0001Zc-Pa; Mon, 20 Jun 2022 02:42:17 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o3B6m-00036N-3Z; Mon, 20 Jun 2022 02:42:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso6524436pjn.2; 
 Sun, 19 Jun 2022 23:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9RugEz0svEGH8SJxwHRGD4trFJNZdxXNuh1w08NlCA=;
 b=KyZs/u5XsBHPuwKOGi8RGRoBksSTOmASbAPjUpVAlO22ZNFLGbbjB+2RBbwS3EQgx1
 V0DEKOpBe43HbqLmzk/A6tvGosSSB21dK2WwU9TGtXYGz1L256/k2YnRyQXdsJurjhao
 bprkaGzEAPPdpuYE5mTn7U8qDjJdRXqyTQGAdh7vTuoJ8W/vCygEgCA/QUA52n9R+Aso
 qfvBQMx9rDku+rGx/D/01zsJR/vtIq4kbaEThBLVXeI6MFx6ymQCW0NGX1rb/R922ACO
 r3+2w9h+DJFv+t9r2IN4KaS5UrKcvRWRf5iimwUGuiTNdtChdk0+HfxCn+wCxEre5C/7
 A4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9RugEz0svEGH8SJxwHRGD4trFJNZdxXNuh1w08NlCA=;
 b=tLM4nFomIpVQ+J68OOE+FOv54yLQyASKaqg1JZaTaKw7M41+u8vbH5QHcJ9xaCWmfi
 nWB+UkJ48MPweL6MQEJux5+0pmC5nEPy4KqYPv8bV82397Jv701tPqUHzAfXk2jBeNd4
 8KLpCT39gIKh55ZBzOvPrnPzvOqMm73KT91yZ8v+It1EOKwb+FJwOGOiSnGFfv0ek93Y
 AfrHhr7Ewawtc/S2kLyGUg9lEj3STG5PJp6MJ4XGEPu3+bpq6rnh6xGlwdhmNymggfpd
 q7SvR3jSH1PYRkY3a/sKV6ioMjmiVJ4dkYLrszfSlIHHYa7zJ0NKjsoRqIKwozwp34hP
 A8ww==
X-Gm-Message-State: AJIora9PWL6nnYrKE9Ee/Hz2ZXiAhjh2I7px8JyrVjZGz82WtZivEYBF
 2asJfKy0UYayvcJFBhCL0qmAzj7IJwxy2rE+jVI=
X-Google-Smtp-Source: AGRyM1tYRMdPcEHXCZngGqfxPfyUHczUpe21TiV6IGNz3O08BF0jNK2X8Q0v7r4ndodOcR/J1fQ7wm9HRKpwiZXu/D8=
X-Received: by 2002:a17:90b:3b4b:b0:1e8:434c:5ab1 with SMTP id
 ot11-20020a17090b3b4b00b001e8434c5ab1mr25461234pjb.129.1655707314963; Sun, 19
 Jun 2022 23:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220618201433.240973-1-qemu@ben.fluff.org>
 <20220618201433.240973-2-qemu@ben.fluff.org>
In-Reply-To: <20220618201433.240973-2-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Jun 2022 16:41:28 +1000
Message-ID: <CAKmqyKP1-VSLUZRajf88Rm5KBG=qLxuj-hmVNReZbs03Hm07rQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] device_tree: add qemu_fdt_setprop_reg64_map helper
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 20 Jun 2022 06:42:22 -0000

On Sun, Jun 19, 2022 at 6:15 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a macro qemu_fdt_setprop_reg64_map() to set the given
> node's reg property directly from the memory map entry
> to avoid open coding of the following:
>
>     qemu_fdt_setprop_cells(fdt, nodename, "reg",
>         0x0, memmap[SIFIVE_U_DEV_OTP].base,
>         0x0, memmap[SIFIVE_U_DEV_OTP].size);
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> --
> v2:
> - changed qemu_fdt_setprop_reg64 to qemu_fdt_setprop_reg64_map
> ---
>  include/sysemu/device_tree.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..79ce009a22 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -135,6 +135,21 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>                           sizeof(qdt_tmp));                                    \
>      } while (0)
>
> +/**
> + * qemu_fdt_setprop_reg64_map:
> + * @fdt: the device tree path
> + * @node_path: node to set property on
> + * @map: the map entry to set the reg from
> + *
> + * A helper tp set the 'reg' node on the specified node from the given map

A helper to

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> + * entry.
> + */
> +#define qemu_fdt_setprop_reg64_map(fdt, path, map)              \
> +    qemu_fdt_setprop_cells(fdt, path, "reg",                    \
> +                           (map)->base >> 32, (map)->base,      \
> +                           (map)->size >> 32, (map)->size)
> +
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>
>  /**
> --
> 2.35.1
>
>

