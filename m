Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcqoq-0006HH-Ms
	for mharc-qemu-riscv@gnu.org; Thu, 16 Mar 2023 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcqop-0006GE-LM
 for qemu-riscv@nongnu.org; Thu, 16 Mar 2023 12:51:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcqok-0003zP-96
 for qemu-riscv@nongnu.org; Thu, 16 Mar 2023 12:51:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q14so1508426pff.10
 for <qemu-riscv@nongnu.org>; Thu, 16 Mar 2023 09:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7AgjnkZ2ngDrnmfTbD/UWVVgINk3vM6fF6Eu3gWYAfQ=;
 b=rV2RPyNV7i7XCEgyngu2kJfmH7H5NqrndfnfhE49dCw6eCf5wgkaWB7FL53P1xto5g
 C7hHhuXvlhE9/3HnJHgCB8HRiOoLjlmGwiqllTjFUhkOYeMJwTrq77w4aAqkpHK1iFG0
 OZvmaJOWw467AWUs/CeDr5be5c+F3DUw+eL09eXkjZgI32YGx0vxvljstwfr1vMEaoBl
 qcUvBQA0CIolEZPqvBrmgNEop2iOe1fQOgRT7WC4WIAOyJ2S6k5I/37mdHrXnJZXPljX
 AvKX3jzTpR9Rmu0xCOQHE2k5QT1uFG7GWGD5GoXxq755If4B+/MkPNKoyTXsIB9sPX/y
 PYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AgjnkZ2ngDrnmfTbD/UWVVgINk3vM6fF6Eu3gWYAfQ=;
 b=SzgZ6wxPmXF99b7lsVZ1w6Zsx5aDvhMR+nABJTH/57Y6BslnsuqwKFMUQgnX4rQ9qM
 Jq4WzKCeR5sSqaooDHAdB0M88inNQrTPCdL4Y44c83ktdf/w0trjB7qwJbJ4pTSC4YH4
 Ew/hc+XGXkJxFsJ3GGLFFZ5OQm9fgAA8BJcVCInjCOYyAHIo2enGR8VpW0CSLsOs2vGy
 clZtQkbkLQuMXmAtcqraPMRws7TIS0vEA6/cz1UYNRPMpt6Zmw4HaTqq4kyi5bfjdHBl
 BMEvZ+WM0xY3aJnP3XNMyswEOKA9g+NM2EVNlhITJDYwE0+pPaCX8HXAwo3sAwJiQAqk
 jJ5w==
X-Gm-Message-State: AO0yUKVUopzpyjF+vUdJRaCRHSJR0Rqbla0xHkI5a8TrnkI/IVjq6McS
 8O89dLj3Q2MCPMYpV6J19uuBnV+dVmecXnMJWXDUsQ==
X-Google-Smtp-Source: AK7set+yMtUwfJnUezoj1siuD4khSSeqSY4t45K8vxDk+2zyPdUA99HNtW02GHb5+PDoyOx8835cM428WnOYhAeHdZA=
X-Received: by 2002:a65:4183:0:b0:503:913f:77b9 with SMTP id
 a3-20020a654183000000b00503913f77b9mr1063888pgq.6.1678985464567; Thu, 16 Mar
 2023 09:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-10-alex.bennee@linaro.org>
In-Reply-To: <20230315174331.2959-10-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 16:50:53 +0000
Message-ID: <CAFEAcA_EMVs5gPm6MYKOCYyMXfeJ4whKg0Q8WUNYmVk7fY3+Fg@mail.gmail.com>
Subject: Re: [PATCH v2 09/32] include/exec: fix kerneldoc definition
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Hao Wu <wuhaotsh@google.com>, Cleber Rosa <crosa@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, 
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Alexandre Iooss <erdnaxe@crans.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-ppc@nongnu.org, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Sunil V L <sunilvl@ventanamicro.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>, 
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>, 
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Thu, 16 Mar 2023 16:51:11 -0000

On Wed, 15 Mar 2023 at 17:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
>
> Message-Id: <20230310103123.2118519-11-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Note that Laurent has picked up a different variant of this
fix into the -trivial tree...

-- PMM

