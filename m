Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omuXN-0006Uk-HT
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 06:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWx-0006MJ-OP
 for qemu-riscv@nongnu.org; Mon, 24 Oct 2022 06:18:09 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omuWv-0005Kc-18
 for qemu-riscv@nongnu.org; Mon, 24 Oct 2022 06:18:03 -0400
Received: by mail-pf1-x433.google.com with SMTP id b185so2376879pfb.9
 for <qemu-riscv@nongnu.org>; Mon, 24 Oct 2022 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=HmBXZVaH/gLPCmR3huEvCZWv2M3es8sT2jtuxS6sT9V7rVQ0SUTizHC0glPr0mKEU1
 CZnBK6lqs353Uz27ikOqRjcE2L+Px/66rLKudb6lLiLhDx7oEexznYc3RSGzAIk3b8uo
 UZza+QXBUSYJUG4mW5spNAn1+RzuKacbhun/1g7UFrvTOJwj2XCUC4m3ngjVLCz+P6F8
 UoRY87QVAl9yNE3kTvaYncerHDTJJFCcPILFfjwsoF/Prtdgn2xRdoDGymd33T4UC7CJ
 DrK4KhSDAgyPm1p/UbpAaahxJVB45YR9Mr6vqsOC5sGpBhi9wXyfGB9XxOj0u7UgqDsY
 0wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8M9WmVJUvXKEvxToF1eUHXwfivIiyL/p6arcwPokscQ=;
 b=2QO6W8+pkPMQrYHDZqB5RMzSDL3Zj4O4kmS9KdiDZpVu0DV5VsFQL0Nsq5/1uM9xq7
 FXt5c2Vl+QcG57XC0IJ76SUwTz7gHt8SARPwGRo+sEXtdqW4hL8VyKoqbjrxgl62bBaD
 B7qxlt8irM1QHfsRvW7uHzzNgg+4aLILamJsr6dSLw/IXYYvXYRstYOcN2l4EWAfmdVa
 sbZKceHwDY+Y0W7igINHKM9lQy7QYnbA9a9cdZlqReRESerGecNmZKoibceQFfN0ismP
 1FLDlOVIOf9bNZHhBYqB01UuxsL8YBOTsGpEpHe8xEzfPssv7FhGHqkR2qaRC7IbDkhI
 J3og==
X-Gm-Message-State: ACrzQf2Nui9PMofWJEJ1XSKSyz1Oe3s2c3zoZKs4KVQqldajqWcwA+3q
 2wZ3ecwtabhZLgSxXrse74sdSr5XE5FSc3G5I/0ekA==
X-Google-Smtp-Source: AMsMyM68sGLkBZVMotXjm/AbD7mS7wHKg5xsY9Os2hdG0o7EMyWrFP98MMkn+RoplBS7fhXv4EUZYz3gEtTRjcBLWd8=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr27646498pgi.192.1666606677719; Mon, 24
 Oct 2022 03:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221024072802.457832-1-bmeng@tinylab.org>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 11:17:45 +0100
Message-ID: <CAFEAcA_547EyiBQotG-E--Mb_t4XBCfxx5XsaTYAW8oe1Xm+wQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Oct 2022 10:18:14 -0000

On Mon, 24 Oct 2022 at 08:28, Bin Meng <bmeng@tinylab.org> wrote:
>
> %s/return ;/return;
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

