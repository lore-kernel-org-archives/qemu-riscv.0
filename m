Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRHv5-0001ht-BN
	for mharc-qemu-riscv@gnu.org; Mon, 07 Mar 2022 13:17:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRGmj-0002Px-B5
 for qemu-riscv@nongnu.org; Mon, 07 Mar 2022 12:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRGmg-0002Gr-8A
 for qemu-riscv@nongnu.org; Mon, 07 Mar 2022 12:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646672673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjafWO1SFD8QIqnhz1Zoyc/cfFJ/QTE75SQNxTbTcCQ=;
 b=SuEUFcYVnkEFv4YCdj1aIZwEJamFN4AnP7JAkfxZyMLmkidJrDqbGe9zwGcAvipltKSNQ/
 GCIVl+IoByuTPvfZIm+wdbFS92zOIv4L19E0FtBJUGrHO2Vx2JXtLP6dR/N/ih06YGMKzj
 t9slvsjcbG9UZAqFDkzssOd/r9BGUWA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ivTlJqqOPX-xJKbzfKd0Nw-1; Mon, 07 Mar 2022 12:04:31 -0500
X-MC-Unique: ivTlJqqOPX-xJKbzfKd0Nw-1
Received: by mail-ej1-f70.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso7287332ejd.23
 for <qemu-riscv@nongnu.org>; Mon, 07 Mar 2022 09:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EjafWO1SFD8QIqnhz1Zoyc/cfFJ/QTE75SQNxTbTcCQ=;
 b=A5YOBXIWyY5lEpRdn/sEJAN+CKR553d4fATGLp7sQKLPrX3ragl5NKWiVA0V8KjcYj
 gGdh27OpIHXzEDEKx40rexol00f/7TgUMFq4X9FMO3Sax/aY0fFJ65ex7B4TNRlUfYIz
 ma7h0AXWwB4tVjap2/SydhT96tKfjPLdqbHbKruoLvZEORpjfbEugTmG6JNiC3ffT2o/
 kwLG6gnsCFlMjKZ4wPG3s0UBtDzeIEXiqeUOhy31meWnL6IMh+/US6hySVGqK7Dw6nF5
 dOTRaFLx4gZ4Wm8X8yhsRSgFan0WHZQKG/pw5mtfQgDEAqNOlinOwkNeSUwWHFDM3Uke
 Pprw==
X-Gm-Message-State: AOAM533bNWqEAWzr5+ffuAxQvVMF6qkBva/ZLBR9wblFSNZgExdNSgm+
 l46mdiVll+MPIlw7DSKBTGyzcbcqr967fNXnBW8zXvkqV9aAYAWgWsKT5dgoeWlzg/ty5+1pTKB
 Yzhu7jXvOjWNzm/g=
X-Received: by 2002:a05:6402:26d0:b0:413:bfbc:8343 with SMTP id
 x16-20020a05640226d000b00413bfbc8343mr12167614edd.211.1646672670398; 
 Mon, 07 Mar 2022 09:04:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl0R8nz+p9bV7Se1hqjDdqOsgzcPZSQ63/pVf5L+VMSWNAbMkzhc8dBJ+U0tGf13I7BvOQjg==
X-Received: by 2002:a05:6402:26d0:b0:413:bfbc:8343 with SMTP id
 x16-20020a05640226d000b00413bfbc8343mr12167587edd.211.1646672670065; 
 Mon, 07 Mar 2022 09:04:30 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 er12-20020a056402448c00b00413d03ac4a2sm6150460edb.69.2022.03.07.09.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:04:29 -0800 (PST)
Message-ID: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
Date: Mon, 7 Mar 2022 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests: add (riscv virt) machine mapping to testenv
To: laokz <laokz@foxmail.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: kwolf@redhat.com
References: <tencent_451EA141786954DB4F7E4D7D4F9334EE1106@qq.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <tencent_451EA141786954DB4F7E4D7D4F9334EE1106@qq.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Mar 2022 13:17:12 -0500
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
X-List-Received-Date: Mon, 07 Mar 2022 17:04:40 -0000

On 07.03.22 15:13, laokz wrote:
> Some qemu-iotests(040 etc) use PCI disk to do test. Without the
> mapping, RISC-V flavor use spike as default machine which has no
> PCI bus, causing test failure.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894
>
> Signed-off-by: laokz <laokz@foxmail.com>

Hi!

Thank you for this quick patch, it looks good to me!  I can reproduce 
the problem you reported, and this patch does resolve it.

There might be one problem, though, and that’s the Signed-off-by tag.  
The qemu project requires it to be formatted like the Linux kernel does, 
and so our docs/devel/submitting-a-patch.rst file links to 
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297 
.  Like the kernel, we thus require a real name to appear in the S-o-b.

I’m used to seeing names written with a capital letter, and personal 
names consisting just of a single name are rare, so that’s why I have to 
ask you – is laokz your real name, i.e. not a pseudonym?  If you say it 
is, that’ll be fine for me.

If it isn’t and you don’t wish to disclose your real name, that will be 
a bit of a problem legally, but I think in this case the patch is simple 
enough that we can probably find a way around it.

Hanna

> ---
>   tests/qemu-iotests/testenv.py | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 0f32897fe8..975f26a785 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -238,6 +238,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>               ('aarch64', 'virt'),
>               ('avr', 'mega2560'),
>               ('m68k', 'virt'),
> +            ('riscv32', 'virt'),
> +            ('riscv64', 'virt'),
>               ('rx', 'gdbsim-r5f562n8'),
>               ('tricore', 'tricore_testboard')
>           )


