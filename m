Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBwVO-0005oY-Gg
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 05:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBwVM-0005nL-8d; Fri, 06 Aug 2021 05:51:04 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBwVK-0003MF-QD; Fri, 06 Aug 2021 05:51:03 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z128so14108818ybc.10;
 Fri, 06 Aug 2021 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nxTUUxjSKv7UvgfzZKS2f5xU8OzT9l71j1ZoCON98PE=;
 b=HZKNGAg1VlOlt82mKggQSKH8sXNr/Wnr3NBO8pGsoIwiwpu30BPsqxAfOG0AkjM0yP
 N4zuDlpsWjMVa1dpdpR48Lkm5BAtShgA1okbBYopsBDzpkUtPtrMFRIcfXqqf+99uksA
 4HVNHT5EcwHwD9XsmTd0V31Y6lgyXEKWURfFtvUs5+eBIorLak798dhGKxPUIMM5bDMW
 D9M8CJkJBKaAQdI7LMIcvL5NhjlpzThC5L2D1W15cumO3+oRUlZL7nwJc0qXMTtHi7Dl
 PFFhABxq7qWOHNsflAC45O8sd+2HinA98Hc6qJ7EvBkHBEws4XsRrA3QfEiVDWvVT3Pe
 9twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nxTUUxjSKv7UvgfzZKS2f5xU8OzT9l71j1ZoCON98PE=;
 b=cj1yP6IGzNCM9FKQ4wScKfeUTYspaoq4HIwN87i0mpyIS4pF5o0R89mnn6K6PfJQuI
 HXJJtcPhmXQdwuO2Dby92c1cL5Ifsd00HpwgMBt36h/1A9ZZdl85hj6jMhI90ndH3Z6u
 gZpTkyLMCovBtb05ngD07GFLNIdOdz/uvWiU1u1t+IzLaVFcVojJNjdn7JMCz9yIkcy3
 Ni4HXxd5aGGOGZRhu/bFMV+rulUR5iastEV3dTKnFEbBq4vFR+HtlYtu2BpvbXYEHuGp
 xlIX2Pm2IIN8XGkSfXt4faOmKUzq7V1lVYPXr5WxYTgMpX6VpZ+uTIHFAwNJb95YkjO9
 3xtg==
X-Gm-Message-State: AOAM530SOeuUaGOL/EkCfeLYlHGI0h8z8WkiL8lGO9Fuuk1mEqI6GVuI
 XJg8VzWD2nHxtJCdUf5RMkrNGBGnpuNNHH0+RvZZ8NDq
X-Google-Smtp-Source: ABdhPJyBBQGUbr+o5D91jM9NqXgP6FKZoYHbXLe/v5WF/uNP9HHfb6IrMGS160+QBBHeXPgoXdpOdd4Dgtn4wX8IPY4=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr12325145ybg.306.1628243461105; 
 Fri, 06 Aug 2021 02:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-4-ruinland@andestech.com>
 <CAEUhbmU=PN0K+jQzYsbw+0WK6C6w85t2tNGhW0uHJMgfeKvCfw@mail.gmail.com>
 <SG2PR03MB4263ED48818608B30AE3C801D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB4263ED48818608B30AE3C801D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 17:50:50 +0800
Message-ID: <CAEUhbmXqR0COjJEE5vOvydc06FMtxXnJB-bwsf1v_6+yATPmPA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
To: =?UTF-8?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSjolKHlgrPos4cp?=
 <ruinland@andestech.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?RHlsYW4gRGFpLVJvbmcgSmhvbmco6Y2+5bKx6J6NKQ==?= <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Fri, 06 Aug 2021 09:51:04 -0000

On Fri, Aug 6, 2021 at 2:12 PM Ruinland Chuan-Tzu Tsa(=E8=94=A1=E5=82=B3=E8=
=B3=87)
<ruinland@andestech.com> wrote:
>
> Hi Bin and Alistair,
>
> >> Adding Andes AX25 and A25 CPU model into cpu.h and cpu.c without
>
> > The latest RISC-V core from Andes is AX45 and A45. Should we just
> > support the latest one?
>
> Maybe we can have them all ?
> AX25 and A25 is still in production, and we still have new clients using =
these CPU models.
>

Does AX25 and AX45 have any significant difference?

Regards,
Bin

