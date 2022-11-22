Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxTi7-0004oG-DF
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 08:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTi6-0004nS-5O
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:53:14 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTi3-0007mS-Fy
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:53:13 -0500
Received: by mail-pg1-x534.google.com with SMTP id s196so14155937pgs.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Nov 2022 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xbzPrvxw2h7QjvfNhdzgLlnm6lp5QdzEPwm67XjpXOk=;
 b=KzxzDmjt3znUwalezP3CogqSzCZmmSdieXsuEUbDMNJQ9BxfDXUwc+Jjh1RAQGzk0D
 M7x9r/SjnqM10pYpZuCABWbQ7V1g5C6osSxkT6Br6avxn8juEptKc8jM4Zvy97pWqkze
 a8IhFy6/udMHHmWkgjN3UJLA59FPoimJ6EvSnpSku0EgcjhXX5wga4zyoA5osPg4IxXg
 wVpMsJvg3h7CXeilGTVRazsQaWbmJ5LcklLQYwA14AMp07Y8iYKTwh29nF/HOjAPjHse
 OWfDTIDIxGNoLOhSEHOa0Kb9Q07dZKa6Ol7dw0NPlaAlaBB7hX9CWrCoZ9w5z7seAnKb
 m/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbzPrvxw2h7QjvfNhdzgLlnm6lp5QdzEPwm67XjpXOk=;
 b=eyfGKVV0z6aduHL6WfybAvrWA+sNoTEw/o2Wt5ZVd+bdQxkXzDmoLT6XEyOl2jlZhB
 jUoKYNWurrtbXLt92QSjpD7Al3gh11VJqWpilVjWZNaxGnrwmET6fWkNnbwPc0Xn/abg
 KHoaLvrI95nHmnjtrjP9iei0cjXnuBCvj1o6rBpzFqpCeNZ34iGDA8PbUATtnzyl+qhh
 He2BaHcxcXbaneJtTf+pWFnNJBVlp9xQzvMsNznLbARtzde4m3hA+9ZZi8ysOXU79sk0
 8QN4uermWtN0iPSjTE3yNE2OZ/iP4j8jafJwakcINY6KMB4YFq2t8jXiGQQt/k9u6rTq
 hHPA==
X-Gm-Message-State: ANoB5pnfswJ2De+cf5XyUsE/XAaSu2+UF79rAkiBzyztT5TvRsnV11eC
 73HdCTn+TTPLA3jRBEEf7w4dBS3bjKr8xONLPoOhxg==
X-Google-Smtp-Source: AA0mqf7uJDc+t9e/Y08ngYG7hQOTu/YyRZ31RjOkHgWurRwDrL3TW4R1LORRfIhY9ViEUKgriEVWGpoXxo8XruhtkAA=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr4639210pfb.3.1669125189925; Tue, 22
 Nov 2022 05:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-3-armbru@redhat.com>
In-Reply-To: <20221122134917.1217307-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:52:58 +0000
Message-ID: <CAFEAcA9q=zAL-PrpRpmpv-4wyobdbFGLzYeWdjvkDoSQLwktOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] block/vmdk: Simplify vmdk_co_create() to return
 directly
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu_oss@crudebyte.com, 
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com, 
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com, 
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mrolnik@gmail.com, 
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com, 
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn, 
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com, 
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 13:53:14 -0000

On Tue, 22 Nov 2022 at 13:51, Markus Armbruster <armbru@redhat.com> wrote:
>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block/vmdk.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

