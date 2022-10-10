Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohh4g-000719-Tl
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 20:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohh4f-00070p-2x; Sun, 09 Oct 2022 20:55:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohh4d-0003HP-JA; Sun, 09 Oct 2022 20:55:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so2362515pjg.1; 
 Sun, 09 Oct 2022 17:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XDp7xeE4xN9mo2bpGh3E+Xfj/GY9xfGg2DLnMAKvId4=;
 b=BDC3NTnWkpKbOZcv8brdczaObnSsEPf21GT9QLAMLous7Bz0Anh5ditYkI6M1Yc2pD
 w/z0Qo2pUyJVQWypYJGQYxKXmPvLhnsVUhyp1aU39YB/IUe3lHuIEu0opR0F4ln04PAV
 Hllcey7LitpVNqxvjaQEZhnjG0aU4JodgUTebDt4xubDaYzALMcseP0rtCfQ37MxW+8c
 t16rol4N8oY4+zlv+hmv2bVMK2R17fFBG9Vb2kKFdTXnX0g3QTLdLoJIogjpVDVaXoYo
 yblXtjeMKRLa5HBaQ8hpTSC+HwVRcwop+7SN9k1BTHY9/o83z6JiP0sxbdMBAHkr70oV
 JaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XDp7xeE4xN9mo2bpGh3E+Xfj/GY9xfGg2DLnMAKvId4=;
 b=Usb2Xi/YsOnED8jqZD9kG7+fRuaxKDaaNx/SkbndsY8oJsNijnQ/UNBhnDc8jJ8Euj
 KsCk0MVPsAHQrMaajDVbzB/YpLpX3HLPQRa6zILNA44x7ARglUswsoIsXXG6hwm2n+RV
 /t5w3D3+QyXQ194lLJUBZJHXr5Kx4L51LgMRNtcV6jUUy+O4cDYQKaJPPa+6YCkJ6qFj
 PTnLfAi8lYZcZKdQgit0M5kfFziy5GcX58mwotV2bKwNuiox1JEgmggTwP3ye7YnCuDF
 G4ewe/oEUkAig+lj/jKnQL7cEjdB9ubNUIMRSMc7fNcv4okOhKrWFFESsrypVaKw4Yu9
 ypYA==
X-Gm-Message-State: ACrzQf2enflal2XpVPYN/aeskSByZtpRtJid0wjky1jhAOcMfPzTPriJ
 BY9WGQ7TSb5y6VpcPQd+ggfuFPdrNWAoAzGi2LI=
X-Google-Smtp-Source: AMsMyM4ZkdtoDR4VkYdTJSzERTy4ihsUsds0tVng0w0hocfANDfdSkl2LoaYXbGqcwEAao+hbshaxe5WZHtHAVufh54=
X-Received: by 2002:a17:902:b092:b0:17b:833e:74f7 with SMTP id
 p18-20020a170902b09200b0017b833e74f7mr16380591plr.149.1665363313373; Sun, 09
 Oct 2022 17:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd08.prod.outlook.com>
In-Reply-To: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd08.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 10:54:47 +1000
Message-ID: <CAKmqyKOJe1PYhU2dAEnXUG09MuDHT14JtTU-HDAQdpDByFWgbQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Update comment for qtest check in
 riscv_find_firmware()
To: Bin Meng <bmeng@outlook.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 00:55:17 -0000

On Sun, Oct 9, 2022 at 11:04 PM Bin Meng <bmeng@outlook.com> wrote:
>
> From: Bin Meng <bmeng.cn@gmail.com>
>
> Since commit 4211fc553234 ("roms/opensbi: Remove ELF images"), the
> comment for qtest check in riscv_find_firmware() is out of date.
> Update it to reflect the latest status.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..f6e8eafa28 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -111,8 +111,8 @@ char *riscv_find_firmware(const char *firmware_filename)
>      if (filename == NULL) {
>          if (!qtest_enabled()) {
>              /*
> -             * We only ship plain binary bios images in the QEMU source.
> -             * With Spike machine that uses ELF images as the default bios,
> +             * We only ship OpenSBI binary bios images in the QEMU source.
> +             * For machines that use images other than the default bios,
>               * running QEMU test will complain hence let's suppress the error
>               * report for QEMU testing.
>               */
> --
> 2.25.1
>
>

