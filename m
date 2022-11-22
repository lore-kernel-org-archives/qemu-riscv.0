Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxSdx-0003cS-NL
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 07:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxSdw-0003bq-5s
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 07:44:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxSdu-0002Jv-DM
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 07:44:51 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b11so13175717pjp.2
 for <qemu-riscv@nongnu.org>; Tue, 22 Nov 2022 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JFxsDQv6CSq9GlpH150Z29J2XyCbNQXqprtE7CsKApA=;
 b=IhQz5NKwo5HSqcfJsohSjWqXDmoKbpH9U5+GYIc3Y95g7VWiYfQuxKHL9nvw88vl1X
 4eUE8NeS7WxWrJteQ8znbCRFIbTjtI4BoNIP20YtiqZI2Lm1hKj2x6cote+2SYw49sZn
 s6f0LXvlYrxZibY97aycRKWWgUiV5/WuAX8Of2Ilv0Ep/fUyC0v+LA3H7zI9aTvlFUJE
 UNJfN9MRCgxr2a1a1lDjTVSHuc8Wwo6YYoLxijUTwqWzkCH9jbA770ChFM6PeFYAKqnJ
 VUjQ0j+ud3KiczZGPTpxH6aPaQq7AMFNmiFmV+Ueu8c6MP9+2vLjkuuhWNziAU62xTIq
 vdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JFxsDQv6CSq9GlpH150Z29J2XyCbNQXqprtE7CsKApA=;
 b=RgN3xeDzHr0pVNESEQcTV8buPXVrDFtF7YBVJkEpvsp2tW4K44/QXfB+TSJpjpTZ3h
 Tlksn6XUJujZpXReaN0cvEpoimNj4Os0wBUZjnNHqpznMvV7qDmV5O/+bEaTCNRZFulX
 tjhJDXgrOxxvjHNQAdvO81Err7Qe5T4UJhLPgVRk1SSJRzI0lj2cWELrv+otFzFgG7p/
 EPDjiq5FKsk5cADnzFv0aIY9SM+B1O87Ka71S3KJdmocQCJkJ20svbgXfwldktYQ7vk1
 q1lpWtgll2qm2QO6d5lY8G3llQtVa6jo5Bryh9QDNxzNkZCc5EMvDqe6TiS5ztxZBPoU
 FYGQ==
X-Gm-Message-State: ANoB5pmp43w2OaON2BZlfZejn9p2syzop0wyo8DDUPnn30O3+Zm+mZju
 vbR6beOnKELWAf57or7eMnxkUXc3OaFi9B8tCsbYDg==
X-Google-Smtp-Source: AA0mqf4IbU0hXlv8ndObC5JvfcNTyBmLw+g0k+9VGg57J0mkdoSlOqPRj63jkCMWxXmva/XH7uccIKD8sI5m5LlEBi4=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr6639257plk.60.1669121088621; Tue, 22 Nov
 2022 04:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
 <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
 <87a64ki7zn.fsf@pond.sub.org>
 <47e0d3d8-607d-5e29-6780-c0a4364993a9@redhat.com>
 <87h6yrfjr4.fsf@pond.sub.org>
In-Reply-To: <87h6yrfjr4.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 12:44:37 +0000
Message-ID: <CAFEAcA-8tyYDMaZgYvhrG5G001HzgkCUoTUMbChDteJ+q-r8yA@mail.gmail.com>
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, 
 groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, 
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com, 
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com, 
 david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com, 
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com, 
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 12:44:52 -0000

On Tue, 22 Nov 2022 at 08:58, Markus Armbruster <armbru@redhat.com> wrote:
> I don't think complete detailed review is necessary or even sensible.
>
> Review should start with the Coccinelle script:
>
>     // replace 'R = X; return R;' with 'return X;'
>     @@
>     identifier VAR;
>     expression E;
>     type T;
>     identifier F;
>     @@
>      T F(...)
>      {
>          ...
>     -    T VAR;
>          ... when != VAR
>
>     -    VAR = (E);
>     -    return VAR;
>     +    return E;
>          ... when != VAR
>      }
>
> What could go wrong?  Not a rhetorical question!

The obvious answer is "you might have got your manual tweaking
wrong". A purely mechanised patch I can review by looking at
the script and maybe eyeballing a few instances of the change;
a change that is 99% mechanised and 1% hand-written I need to
run through to find the hand-written parts.

But mostly this patch is hard to review for its sheer size,
mechanical changes or not. A 3000 line patchmail is so big that
the UI on my mail client gets pretty unwieldy.

-- PMM

