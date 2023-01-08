Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEMOR-0000tM-U9
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 22:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMOQ-0000sm-2F; Sat, 07 Jan 2023 22:30:42 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEMOJ-0002Qv-WF; Sat, 07 Jan 2023 22:30:41 -0500
Received: by mail-ed1-x530.google.com with SMTP id z11so7719625ede.1;
 Sat, 07 Jan 2023 19:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMYQVCrCY7oa8m6P8HZtqr54QkW0vIb4olvZBCakXRA=;
 b=SKh47xUqM/rFbv54PD2/Wwb/bMo1kTXdjlz6ibpNRX/5hyGhgAnrbXqZEstwmejDYD
 Vg4gcJ/fzUwjgj3TZmpdtSxzzPXnh+CCvkmpoyE7tSxOUh5YRjLHn9pSeIDP0ApfsdfI
 rlpS0z746aC/xuqzDzHG67rukTG8Gt5rYnvECf/AUQVMki6gI/5o+zDLNpUH+42a8gNT
 IfMlEjvhMIdF74BrZz0W24lL2JBIdKxIx1nWW1qz9jiLiM8qpF/kjr8Z7VoKLFIOv/V2
 giy3BgBAkDCTBNLIjHSNrM8prjlj+0s8R7dsPq2WB1hL51wlzsQwK2VwkLU5aR/wX+OV
 /kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMYQVCrCY7oa8m6P8HZtqr54QkW0vIb4olvZBCakXRA=;
 b=qeULvcdRWQyQZu/RbvF0neleFqJ4Xjrytq+1shj4aFlqoGyUOkydUPqzQH1tbAFdY+
 1UDNQn4sIPwAft2pqlJDswIKxgMryWZKkCqUrq3McUSRDb4/ubrKMOnQeXOCaBwFhX0p
 42afi0tTjsur9F4Hb9GqhmFZK3J+q7hIihUM1GdJbUVhmKOSKK34ifKfiIYmsNkfdIBt
 SD+R+DhrsXPTCzEPuJ5nXmBbbpnCSfC5BJI5wvqzafw8SwluXH2W89jDu9RiAdLSwMRj
 MSQ9q9m4izYuI8qOQNPwQD59wakUoXfPpXj531euXoB84Bz3ofMqdMYNPbijAenuGIpC
 LUgA==
X-Gm-Message-State: AFqh2kp/eOSvTm7IUJ/b3QhAuxfQ60k8+QVyHdknI++9idRKUUtVY7j7
 jN7AeA9fqDyqoE7Zbg3kCD2a38pJfOFisIt7NPA=
X-Google-Smtp-Source: AMrXdXuB5E0XjfuCvocCQPtVFZ7wvL3Mz48aVqw5V20qC/sd0v6w2r537JGUoUBsiWcTaGAdsOUH5xTDhZn6MpyZQks=
X-Received: by 2002:aa7:d80f:0:b0:499:dfa:1c6b with SMTP id
 v15-20020aa7d80f000000b004990dfa1c6bmr249675edq.202.1673148633826; Sat, 07
 Jan 2023 19:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-5-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 11:30:23 +0800
Message-ID: <CAEUhbmXiBh+JVpGZ4w7G-yYfTj+qeynMzJm9GB=QBPaid2SLfA@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] hw/riscv/boot.c: exit early if filename is NULL
 in load functions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 03:30:42 -0000

On Mon, Jan 2, 2023 at 7:54 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_load_firmware(), riscv_load_initrd() and riscv_load_kernel() works
> under the assumption that a 'filename' parameter is always not NULL.
>
> This is currently the case since all callers of these functions are
> checking for NULL before calling them. Add an g_assert() to make sure
> that a NULL value in these cases are to be considered a bug.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

