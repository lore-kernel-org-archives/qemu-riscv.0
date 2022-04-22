Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhi0c-0002Y4-BM
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 21:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhi0a-0002Xs-Qv; Thu, 21 Apr 2022 21:22:52 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhi0Z-000316-86; Thu, 21 Apr 2022 21:22:52 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2ef4a241cc5so70661167b3.2; 
 Thu, 21 Apr 2022 18:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtOcA3Ae+9hLVPXEc5Al5AHI9/PfTjihgF7dxjIto/c=;
 b=qpkKdBRNyQ0x+mwBmz2QxCVP/CSMMGaa4y/Z0iKnLcMx56arNSvwP1BbuKSkAj8qvl
 VCc8huTtmHZ90/tGAlJFYj9ZTFrdlvmI7gslePuQ/go1M7NWptnKZx1sx0hT2aHjwMBY
 asn1cLmbU2CCJbKihfxAkTa2BY4ApkG0rJBb3YQ+Y4rHru2jyjjOHB/UB1TXMYfjC6qu
 KPyjb7Jf2nJL50W8xvBOlnRonqZ6bJ0tQCnLtCZdsnwa1Y9PqKh5OoF4//teI8JpFLyW
 I44wskn47fkP/VEak21jtTmsImweHqXzga5L+xm+gSet9ItKbt7HvZMhUmGJraXVneGn
 Qtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtOcA3Ae+9hLVPXEc5Al5AHI9/PfTjihgF7dxjIto/c=;
 b=MRr0rsX/JMB9BL8XgPJQVNaJbSs3FLcspAIIGws7BNM+525Dj3K+IuZHEZNAp+NHFz
 ZdGJDFQNPqb8ACcke3MqFZf+XvIA/Xh3JaV6WZJy+K0m91lT29JoWyZm/50GF9dsvTRv
 JLPsqeNSr/fnYtEtXrh+bxu6ydkC0BcYEYkZP3QtI4BD7pYYwEgM6ec6RM3ePhaSHHxq
 +tusk0fQ46wNM84TQA1dgck0ev+GhBiyw2h4ZXXOZDaGVVzL6BLCBg3WEagexFjkuFzQ
 jI4t+Swc3vT3bpbcPu0X4NOIMt6Lg4xqVSixrNASwQincfa96K1FTqlty5nrO3UvGx9K
 Zl8g==
X-Gm-Message-State: AOAM533mXbKVIxAW9y4AtqUaB0dzUcTu++Qrrwtrs+F5sbCpUf1+zOSM
 EJLMmbzW4dOK1hzDa3ChS79Ynhn72meL3WC+m6s=
X-Google-Smtp-Source: ABdhPJzgt4yj6IV0xQOk1JwhAd6Pwkxoeq+FuniIWzmSdfeVjkG1tfP17mkb8rYwznypDIOHK/GZa1/6IAMhouMfdds=
X-Received: by 2002:a05:690c:102:b0:2ef:48d8:24c3 with SMTP id
 bd2-20020a05690c010200b002ef48d824c3mr2659186ywb.153.1650590569954; Thu, 21
 Apr 2022 18:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
 <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
 <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
 <99634d32-2ff0-cf9b-14a5-02254d878443@linaro.org>
In-Reply-To: <99634d32-2ff0-cf9b-14a5-02254d878443@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 09:22:38 +0800
Message-ID: <CAEUhbmUcPDs7FU2DZX4eA9AHQyDAqxSp=hCTugT0nGVXDXdLYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 01:22:53 -0000

On Thu, Apr 21, 2022 at 11:51 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/20/22 16:46, Bin Meng wrote:
> > It seems you were trying to build every commit for bisectabliity? Is
> > there an easy way to do such automatically?
>
> git rebase --exec "cd build && make"
>

This works! Thanks Richard.

Regards,
Bin

