Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiNxL-0002o2-Uh
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 18:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiNxH-0002ii-3i; Tue, 11 Oct 2022 18:42:34 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiNxF-0001dy-KQ; Tue, 11 Oct 2022 18:42:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h13so13398294pfr.7;
 Tue, 11 Oct 2022 15:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IgKH1le+MX8OgFUXk01KTFglL17/ogWw3zu8IbyzzC4=;
 b=GsszLjfxdx3Q88xtBicOEp8OfZx6LMrPM4W7qB3Q3Xw0nC2gq1v21kjV6AdiNfifFa
 a/GYjJ4ELnwMW7xJdrGjr/kYjBz54dlKrKvb0y88qXT6V6/ql8lLidAwk5YHXu5k1dxh
 JVAgcaoCZX535+JGIwWYhi31bhnPVIUqOm1bswQ2n7D2jm2O2CSbgEikqLx8MMBiVS8K
 7a+Z/cUHzQ7EpkrHYrjsHtXIgGxmn2mNXyt8fhItQKkFyBBJWeLGVTS5PAU/sxG73H+E
 wiNgQv7T8MC1x5ceLG2wdHHFZdoWfdOQLMhrK+UbfpyhLZKkU3Ke1lN8fl+fOZgHQjde
 SOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgKH1le+MX8OgFUXk01KTFglL17/ogWw3zu8IbyzzC4=;
 b=SZATmt2JpeyzM3Kem9c1tZPTNOHE0XudRKja8Q1iu28hNMJD590UFkJEwLyhNMd22A
 m04mvE9WqYsnk763z4NE3CCRMQhpSt5WmNrknrFZV6wdpoWcem/x8arscqoHroj3pr7C
 y+B1lZu2qeD7Z7ehzczT+7JyvevPS0bnEKzyWXcwnGUT3AE2Po688RfoBQTgfuFC/rOH
 zcKb12lcN899haof8xCxJ2sAcp21c+flHs++jdLSCRbIwO6v9sABvlJwnDKYMsALFNDO
 CBfomLxwhqSusgI/IdSGAiMM3wNB8OJCJrvTNLPJqkNH5ZfiJh6eBNghmqfAmNiccxMG
 yOZw==
X-Gm-Message-State: ACrzQf1T1htNrlIBWjVPbTglXxrbvhw+9jTZV1D1tomcPcsxJo5oOHmm
 sBLXy3HlSTXTrV0ElVHkFsvH4RvghcuBYXhD/Mk=
X-Google-Smtp-Source: AMsMyM4WK6R4q1j1fWh7F8v2ycd5+doudrSWbhCBtMt9yTU6JxxYFpSxd/Zmi6WTgujOMbTwwSJ1v9bgF2h82AiY06w=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr22684441pgi.406.1665528147866; Tue, 11
 Oct 2022 15:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 08:42:00 +1000
Message-ID: <CAKmqyKNq=2LbTt63Wfg5gp5TLo6J5hPA1uu42OmvhxRP6YF6Dw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] hw/ssi/ibex_spi: bug fixes
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 11 Oct 2022 22:42:34 -0000

On Fri, Sep 30, 2022 at 1:34 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The remaining patches in this series address:
>         - Coverity issues for `ibex_spi`
>         - Adds rw1c functionality
>
> Changes since V4:
>         - Fixup compiler warning for unused variable `data` in [1/2]
>
> Wilfred Mallawa (2):
>   hw/ssi: ibex_spi: fixup coverity issue
>   hw/ssi: ibex_spi: fixup/add rw1c functionality

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/ssi/ibex_spi_host.c         | 166 ++++++++++++++++++++-------------
>  include/hw/ssi/ibex_spi_host.h |   4 +-
>  2 files changed, 102 insertions(+), 68 deletions(-)
>
> --
> 2.37.3
>
>

