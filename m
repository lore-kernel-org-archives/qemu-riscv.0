Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlTF-0003oX-RJ
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkir@google.com>) id 1kmlTA-0003mU-IO
 for qemu-riscv@nongnu.org; Tue, 08 Dec 2020 17:28:28 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkir@google.com>) id 1kmlT8-0002rK-7c
 for qemu-riscv@nongnu.org; Tue, 08 Dec 2020 17:28:28 -0500
Received: by mail-lf1-x143.google.com with SMTP id s30so600041lfc.4
 for <qemu-riscv@nongnu.org>; Tue, 08 Dec 2020 14:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1flNpuMf3kWpq9CKLXCzBcHoZKv4TnSjzktClhGGDw=;
 b=riwYotL70XKlJLpsfeJKqih+77jDsmT/tNUXLl5B7IPXAMLU/nRsmXJe+sbUqrW8aY
 jYcCb4sWkGXhjLfqNVQ5OYpvMQF4LRXuoYfaPnNFThPJfkXT/AbzYwHmxR+QhqvePhbK
 rYcbQaPcsuY0vCIFj4ANNtRmO248jPqlgyREcdsEYan1DvnSvBvMsO9mPH2dSfJO3jTe
 AD0uOuvZkuPvk7rCTirWcsajQPTUN8fHmQwp44OGBq7xZnYoJwUMG1bVdvK2xNYxckfd
 BEtXgk3oOfDA4xZ8LLLwBJlXfQav/daml21ULtUo5FB1lt+3e5RoSX1Fu/HC4WGAnHbR
 CyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1flNpuMf3kWpq9CKLXCzBcHoZKv4TnSjzktClhGGDw=;
 b=pEsCraUtkjs2CT2IVUXrCWEDGYz2omveAm0wejhEwiT6WYoJzk6PGluxC8lOQFtEm3
 gpY6z0ZCfWMVHvQaxPNRoEOVgl5xFpQOBFzEFT4rHfrFXy/LNxGxBKdePzl6SB4M7Dqp
 4bRhDqBFXrtBIJWf5FjqdkqjM44mm5mraHCbyBHcbrLD3DswZe9k1O1pznTnVS/m0xAv
 bPga29BiIiKgSaOwxGULId2GZCiWy+ao5f6WMoKKZBRX9rKJ3Ov8+qF8J3ED+bWQG6QX
 Oac/tgcC9y6RcqZ4znyGH8JWiPuIX6tltiXTOvhdGbTMml0mUcWD3gm2tRgOaOxIfrmE
 6CDw==
X-Gm-Message-State: AOAM532HrUPCWC8aIj7NqmmCCnbI+9lnzlvJnjI3cbUeaeRMlkavVXio
 rYb3RcbCbnyUSAqxvW/0/x2/VlCi8hJjqjeD/nDrAQ==
X-Google-Smtp-Source: ABdhPJxGCpPC//eZZe1roRUtOxmeOE2ur6lR30dYCQ/57e4kEAtkFqk0+w3Dpi/CKxSPvcALIk9QrCeYoRMeetlPP+g=
X-Received: by 2002:a19:23d3:: with SMTP id j202mr1114346lfj.607.1607466502870; 
 Tue, 08 Dec 2020 14:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20201113205233.827493-1-rkir@google.com>
 <20201113210730.GA1992396@bogus>
 <CAOGAQeq29S06+6M58qF0e4ivjzkZDg4+M7ffSK+FapbgmCBrLQ@mail.gmail.com>
 <CAL_Jsq+QjQxDh3_KDhgE_2A6DjA+gSyvknjrVfRFLMLz-p_M9A@mail.gmail.com>
 <CAOGAQepCsj63yZzJJHKCdHTenkWNLc_v=Ab6PgvS3hzqZMwH8A@mail.gmail.com>
 <CAOGAQepW3pbbjK9KpPZR1BwGY-CGF7V_pTY_9dw98XPgUKYFHg@mail.gmail.com>
 <X68aZ/Dgm7CObQmH@kroah.com> <tencent_3801BEAE39670E174105E007@qq.com>
 <X6+SKQS6QJr25kF0@kroah.com>
 <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
In-Reply-To: <d1d47715-482c-f598-a958-499d9fde21e0@flygoat.com>
From: Roman Kiryanov <rkir@google.com>
Date: Tue, 8 Dec 2020 14:28:11 -0800
Message-ID: <CAOGAQepV2_uNhWmQUG7pypukDsA5E9Uobv-JrqcQrAtxsHttLg@mail.gmail.com>
Subject: Re: Re: [PATCH] drivers: rtc: retire RTC_DRV_GOLDFISH
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>, 
 Huacai Chen <chenhuacai@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 LKML <linux-kernel@vger.kernel.org>, Lingfeng Yang <lfy@google.com>, 
 Rob Herring <robh@kernel.org>, anup.patel@wdc.com, Alistair.Francis@wdc.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=rkir@google.com; helo=mail-lf1-x143.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 08 Dec 2020 22:28:29 -0000

On Sat, Nov 14, 2020 at 1:48 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> Thus I do think it shouldn't be retired as for now. If nobody comes in
> I'd also willing to maintain

Hi Jiaxun and Hancai,

I sent a patch to add you to MAINTAINERS for goldfish-rtc. Could you
please ack there?

Regards,
Roman.

