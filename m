Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnXke-0006i6-4O
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 22:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnXkb-0006gj-Q9; Sun, 30 May 2021 22:33:57 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnXkW-0008Om-Pc; Sun, 30 May 2021 22:33:57 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 207so4394187ybd.1;
 Sun, 30 May 2021 19:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xGJjqN1msWOGlbiFcQDHDC1JW9H6mwSTzelmvsiEbjw=;
 b=MTYcrXK+Xsf9D8qTpH52n3UokVa8s+Gu9Qj7eaCb3lk4iPOIsmhajINZ9VJEKr9fqz
 gPldvz5vt59JoHawIXliRHz7GY9/1qBsr4fHYHeX3DxJbNTGzKdMRRj45IZPF/rmQJax
 C8VYTqACCjtcl1Y059d4Ggc3sQ5+9ZcSsUgg1ygSPfWuZdhCQE+pyUtwb11RntDNbgc1
 buedwmTF9vFODMl7Bat/gREWqKqbfFZIMDsACnqhqO+IKrSGS4+qhExHJNIp5Sc6+tVD
 5K7OkVHbiG+EO4ySx7Zq1LUc5rxTOtcAs/IX3RDFnMOPveFeMBFj15XXe7cGRQccxI/+
 ncOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xGJjqN1msWOGlbiFcQDHDC1JW9H6mwSTzelmvsiEbjw=;
 b=uHXqBjxkOIZhsBWn4S5N4RhDUe6cEs86G+oAmftopXT+2Dd3LFSJtcHw4XB+Qze9RJ
 c85Ga009yaMpn87nfbKRIcri+w5mIebW3hx2lxyLjP2Emv/kVT2C6BH/AdTEc/9lvNRq
 31N76njaAxVPnJ7ToOYYK1HYUFDwGUGxbSVLqbdQY4YwT+Nw24ptjTmICpMOwQZfZTd6
 /dh5PRnMqDbkLQpQ5wywDL6vPdXa1D/Tw3w9VP5pKOxFaX6oGzcSt+wR20Y1o0A9EkXd
 0l4Oc5ktXE3NsVavo+aA1VPn/o0bwNMKnsCUl0Jr1GiBt5W1OzOPXtCIHybvzD7EzAnI
 +zAw==
X-Gm-Message-State: AOAM531M4YHOqtFmUCtYFD7/qWjbQKCJBhf2z0al3X6T1qpVuLw9Z5wz
 KreWMXBdIjbPIC+aa+3O8SvEGAH4zIu4N7lPGXY=
X-Google-Smtp-Source: ABdhPJz0mDl9KL54DtOoUIVZBzHjoBd6ND8VuDMPMYN4Lzbb9fNYPeE6ddwTVcQiGObiSNNpy2QbrEzNOQB6tar6H+g=
X-Received: by 2002:a25:be09:: with SMTP id h9mr30392957ybk.239.1622428431502; 
 Sun, 30 May 2021 19:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210430071302.1489082-1-bmeng.cn@gmail.com>
In-Reply-To: <20210430071302.1489082-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 31 May 2021 10:33:40 +0800
Message-ID: <CAEUhbmWKb3MhYOPHhscecdX_V1dhitmaDPjYn_Mm7rA2nerysA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 31 May 2021 02:33:58 -0000

On Fri, Apr 30, 2021 at 3:13 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
> we can use the new helper to set the clock name for the ethernet
> controller node.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> Changes in v2:
> - use "static const char * const" for ethclk_names
>
>  hw/riscv/sifive_u.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Looks like this series was not applied?

Regards,
Bin

