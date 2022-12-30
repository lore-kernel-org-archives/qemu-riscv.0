Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pBBEW-0004GK-62
	for mharc-qemu-riscv@gnu.org; Fri, 30 Dec 2022 03:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBBER-0004Eb-1Z; Fri, 30 Dec 2022 03:59:17 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBBEP-0000Yr-5w; Fri, 30 Dec 2022 03:59:14 -0500
Received: by mail-ej1-x632.google.com with SMTP id u19so50054830ejm.8;
 Fri, 30 Dec 2022 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUc0juOQjJaqafR8Jo4/0qbZGrExdMwU94S8oWq92+0=;
 b=SyS/X7+m2lW3/K6ocKdN1vVppot/OMDNjaEYI4wIYlmSxsG1TYREbe48ifamVBgHYn
 ekm4yjLOSE+g9uPVwRFxiirPLiUwqcNsZIJadh48NeL6lbTJEJUPLBRPx0y6LRg1hIt1
 XH9T4z90bqddJGrBnSxR4sgFUsCgDsCCTf0jzne+VjqGeVxVjGHPigO7By/G0JkEnKnj
 R1C4M/t1HmhjKb8nmiygi7LymdNoVLj4a+4aoCJqeD6/yLPAPrJ+/Vd+0ZcC1Io4ylVg
 zHPVcJgYdg8ZmqYydASBvTR1QTGdQHgnwkhEzG7/AlmEG0bwpXQIy60a+dVC1tfO8DGd
 B8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUc0juOQjJaqafR8Jo4/0qbZGrExdMwU94S8oWq92+0=;
 b=r7q0nm2zeviGNOl+smt7cJNYwumF8J54v5eIegs82Lp87VVLy+EQHHsW86rvLchpvJ
 8YiVJbpLXaSF5avNZ1E05Vm6FtIu/cUDxeuqmD03v3lyAs2agVmyRonV0ppimquq1MfT
 4n0Brf0Hge4d5moi+6MOmOkdIjBqd/7DaLCnbIdMX4AiKdCai66Q1YtU3VMqYguCyaDv
 ZqK+0ykjek0ZoNhWIOocXhpxES5Rl90Vu9Aeq5RTBacFGVWWKpC/ezIU6Qx1zaOoetf4
 uVzXVYwNCdy08s6FnZrAKfIVjR28MOvWSfrwzoYiUZNhCHvmjYAF5y9eZ985rXXO71Zt
 4I8A==
X-Gm-Message-State: AFqh2kruV0JQxR/YpTEa5elJDMyrPQydr1S1KLBVk90TTNLP3wJz5+mI
 dDJxzqXOfgCV95b/UqSbuBuw4M2ldn7BBNRJM60=
X-Google-Smtp-Source: AMrXdXufjVsnA8Fy4Sbj26o4OHNFTdPl8XFqO4zprYkgMRayxL/qXk/SW5BKtJeHnKhqoQWtm2HqqCFaM2FsvqJIqS0=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr2424495eje.618.1672390750320; Fri, 30
 Dec 2022 00:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-5-dbarboza@ventanamicro.com>
In-Reply-To: <20221229181135.270661-5-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Dec 2022 16:58:59 +0800
Message-ID: <CAEUhbmWEdia4AQ4HK9hxh41v2bWPFSBfkz5DKMzRYqMVwmzfxw@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] hw/riscv/boot.c: exit early if filename is NULL
 in load_(kernel|initrd)
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Fri, 30 Dec 2022 08:59:18 -0000

On Fri, Dec 30, 2022 at 2:21 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_load_kernel() and riscv_load_initrd() works under the assumption
> that 'kernel_filename' and 'filename' are not NULL.

We should do the same in riscv_load_firmware()

>
> This is currently the case since all callers of both functions are
> checking for NULL before calling them. Put an assert in both to make
> sure that a NULL value for both cases would be considered a bug.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 98b80af51b..ad196f0fe4 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -177,6 +177,8 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
>  {
>      uint64_t kernel_load_base, kernel_entry;
>
> +    g_assert(kernel_filename !=3D NULL);
> +
>      /*
>       * NB: Use low address not ELF entry point to ensure that the fw_dyn=
amic
>       * behaviour when loading an ELF matches the fw_payload, fw_jump and=
 BBL
> @@ -209,6 +211,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64=
_t mem_size,
>  {
>      ssize_t size;
>
> +    g_assert(filename !=3D NULL);
> +
>      /*
>       * We want to put the initrd far enough into RAM that when the
>       * kernel is uncompressed it will not clobber the initrd. However
> --

Regards,
Bin

