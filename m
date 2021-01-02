Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kvhJ8-0000gp-Bd
	for mharc-qemu-riscv@gnu.org; Sat, 02 Jan 2021 08:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhJ7-0000fL-8F
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:51:01 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhJ4-0003Vs-Hd
 for qemu-riscv@nongnu.org; Sat, 02 Jan 2021 08:51:00 -0500
Received: by mail-ej1-x630.google.com with SMTP id t16so941605ejf.13
 for <qemu-riscv@nongnu.org>; Sat, 02 Jan 2021 05:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08MZbdL81dXa7tMD8XyvYgTJboEnwKGPjFl7Rg6OUcU=;
 b=YDlNMSaPgb1EYkjDdWi6H00s39qDxMMvSyHGPEw/ZvbH0I5EIH7PxGvIA6ejpgZ23r
 FdDE3oBJUamET2zWa0PnWVKGr8xtWmX9j2Tjtz6CbMoPDOsONUv07/FP4SeoCnhd96+w
 yE21bNSTICXjNzNEGK7FxEUC/il65b1cg9tG4XauxqRvIt+7FM26doOxX8IGi3qDfCMF
 9BB1fIFZ643Yg+LjlOzegUqxHUuM1ndjTwR2l265Is7gTyohr/LYZMKVIJhET0Gb20X0
 WI04O/SlUYwn9ulMPSSAnAl3kRuvAyqpR5/5m/zKrqGuM+kaW4ui9vNvLbxYgVDuiIt+
 XD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08MZbdL81dXa7tMD8XyvYgTJboEnwKGPjFl7Rg6OUcU=;
 b=HfaINyz1wRR9Lo9dMm1hmA+A557KiJF5Dhv9BURMCCtO26zwfCk7oaGKDfgaFQgfNa
 SPUrn3cMHzvc9v7gQsdMbD5pXip3w/dyUOa3+EPXKGBPZlO+NchwzWxMfVNNSS52ESsC
 Rg4l6KTLH/uvt3rU1JxVzXgOs5skaGFlusvChzJR0P2uhHnaqR4SuJU7ZjdMGPZcCbTS
 SLLt/4ECLzz8uwKuj18j24DF4mHVoRg417sB8poIA11l0fJB0Nww6N6pYy8MScu/noLH
 920us9mV8HEVV4zMjbl8FgUGPJ7KohuhPrsf3QmtySpqL0AJinQKTwK0pMSGNy/XgQri
 YBsA==
X-Gm-Message-State: AOAM532DI9iXlV8xCUQry3J8NSIsVIuRKNpDnyAqRkm1p3fPxLOc409q
 f0vjHzedWo193npFhgEhdMeZlyGnVH1fTg4BOK1zzw==
X-Google-Smtp-Source: ABdhPJxv07kMlPZwnyGK3YBvzKr3imeMUH24j8V4gUXlSzDdploOOua3ih3Hrp0rXL0KbCL9op85Aow6x29aFKHEUZU=
X-Received: by 2002:a17:906:440e:: with SMTP id
 x14mr21378196ejo.77.1609595456841; 
 Sat, 02 Jan 2021 05:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-5-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-5-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:20:44 +0530
Message-ID: <CAN8ut8Lo2f+Z0nsxejDCBuJO8AoC2o4QwWX+4es8=MO4KQo4aA@mail.gmail.com>
Subject: Re: [PATCH 04/22] hw/sd: sd: Support CMD59 for SPI mode
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 02 Jan 2021 13:51:01 -0000

On Thu, Dec 31, 2020 at 5:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> After the card is put into SPI mode, CRC check for all commands
> including CMD0 will be done according to CMD59 setting. But this
> command is currently unimplemented. Simply allow the decoding of
> CMD59, but the CRC check is still ignored.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/sd/sd.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

