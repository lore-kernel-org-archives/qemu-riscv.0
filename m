Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn7us-0006Mb-08
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 17:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7up-0006M9-A5; Wed, 09 Dec 2020 17:26:31 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kn7um-0000bM-Vd; Wed, 09 Dec 2020 17:26:30 -0500
Received: by mail-io1-xd43.google.com with SMTP id n14so3358477iom.10;
 Wed, 09 Dec 2020 14:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Re5j94SdPWaRytZbzThMkw+G7JB4JtvvDNG3Oa1OHc=;
 b=FNNiKLns30AR/F+QtCOlkWL31Yz9jvCooyHo/tCF/8gg0p9rNNJ67mRQBuvAseNqZD
 +bJ/8IR5IPIxVNJBYrlyQmb/dW9DoHp5N9W+k8GqvmOI6ZHXNd9RmEqNaa0PCOlJ4asC
 orM3Dwae52RDZUvKP3DxAKto7K6RKEnz7Y2eD9IQ/o2VUhSBCOONgmRTRIOazDe70enR
 auKXC1gt88rLNdQAPJhbXTDYA44LkCTkifpoGPaDwbWg51505KLw77fohGrVBAJJ2tTn
 9EiOZ5yzKE84FzFIhlmi3hfjSw06PBwavjFYA5NRokgxi6v70+KWRGPWxO+MiVXv3pRD
 mDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Re5j94SdPWaRytZbzThMkw+G7JB4JtvvDNG3Oa1OHc=;
 b=NptV96kjoVkeRpJj7LzE9vGBfQEKqaT9fDGR/PsdbTs9dghyZ2JISGDVLP1GTedmbG
 4GGdmHSYuj9thYPMC0Jfb9wSH1hUmwR+XZ+evGkilY+4vpwdiHL5ntTuBkC9FQhGOxFE
 1JH3KEDdxXn1YhfOYlVjws9cFNkkKL5U2N51rNHBoGHVOb1j0gi2+GfYy6OnCZurC2+z
 vDcPJUqeVpwudxxbtSO6x4FL4AzjcyQ0zIhSZ42Mq06ITBJPJCTC4VIcBVRAEKkoTlqL
 AWXTkWXf+dSZY1IGztFJw+admgeZTJwuUDrE4TpcVYzBQi1NxaDZMiW4LiYsdSeBdJN9
 ChSQ==
X-Gm-Message-State: AOAM531W6Kt38417TgtyabFeiUoHHSrf0ZUWWlqmMkKo+eMo1IBzFUtE
 JB2fzo9/YDpwU9+hnekpS9n+e3TTwiPdWAKFyOM=
X-Google-Smtp-Source: ABdhPJxBWRQd71Kk61PaHBKFbSdL5a/0hXbsQ6FQ+A7+ECKGHDGoNlCPqrHnyaiZSIwPWcbYf0cSLskADn0WmjilywE=
X-Received: by 2002:a05:6638:d4e:: with SMTP id
 d14mr5997284jak.26.1607552787329; 
 Wed, 09 Dec 2020 14:26:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <22761a83664e100f962532cfa82b25d1a0a89ba3.1607467819.git.alistair.francis@wdc.com>
 <06b5d390-7929-3357-5e14-005808ab9a4c@linaro.org>
In-Reply-To: <06b5d390-7929-3357-5e14-005808ab9a4c@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 14:26:01 -0800
Message-ID: <CAKmqyKMU8KmULX8mMn782qrPKDFZdJ8BXixtGB8LDS37zRcxEQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] target/riscv: Add a riscv_cpu_is_32bit() helper
 function
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-List-Received-Date: Wed, 09 Dec 2020 22:26:31 -0000

On Wed, Dec 9, 2020 at 7:59 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 4:56 PM, Alistair Francis wrote:
> > +bool riscv_cpu_is_32bit(CPURISCVState *env)
> > +{
> > +    if (env->misa & RV64) {
> > +        return false;
> > +    }
> > +
> > +    return true;
>
> Is this ever going to more than
>
>     return !(env->misa & RV64);

Eventually this could also depend on mstatus, to allow a 32-bit kernel
to run on a 64-bit firmware.

It will also hopefully one day be configurable by hypervisors.

Alistair

>
> ?
>
>
> r~

