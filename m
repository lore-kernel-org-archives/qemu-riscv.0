Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozgX7-00038A-A3
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 10:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgX5-00037G-SG
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 10:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgX4-00064D-Iu
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 10:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669651138;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UN0ku+WTjV7mhjtZkap0R4CwBi6nC5merXOuLJZzUgY=;
 b=WF3fYtgfnIO75XFMHQi9cEEq1gqk8lGln8C8yNgFhjuZlFlP6aBz6wdSyWPxZz8HYB8O3O
 BLpBjNjU0gtH+QWYIwraHrb0DQW7qBJC+eDjngMwStLkI/YtWmgohhdLNVdxad799dljNb
 5Ei7vZWljyuzIzbzOLfclsW9QwzZMhU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-Hys_35yqOZ6dup_OKGxofQ-1; Mon, 28 Nov 2022 10:58:54 -0500
X-MC-Unique: Hys_35yqOZ6dup_OKGxofQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so8755965wmb.8
 for <qemu-riscv@nongnu.org>; Mon, 28 Nov 2022 07:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UN0ku+WTjV7mhjtZkap0R4CwBi6nC5merXOuLJZzUgY=;
 b=b399/oVqKIAcdGUcYS4497Vc83uAm6Kz/rXVVFq3RmJmPEs+clH/WA53Nq9CCg3jmS
 T/QLQkG5Pap50u76jCaOR71J/RR+wtHUeIhZfkDjJ7SvgRAe0n3dHRywTTMTwGJ2XMaL
 Abn1lbWMiwLeuNkNCgXCnFefrBKhamXju4todOYfN0qeQI8RElSwBMiPyiZm3Nu5jQgZ
 O7qh6OCgGTVDKYwYap6E59c+LtHw5OxWJtyg+HuxF47x2wiWZZqK+hirLVZLP7L7ASiE
 FcjLperCnIIEjXo+CalkJ0wlyPi415YlZIsAdfGfIsW4VwEtno9fDgcU6rOeFUEkt2ay
 nmqA==
X-Gm-Message-State: ANoB5pkvqkwOZxpkQNy47+ZXxwvXasaumYj3DswK1DvTcxwqJjtOiuXO
 4M3Eua9cCFxGQj0aD62qUyk5RPPpbNSj3Nf5wmeEjl/yBuMDomevwTKg0VxYZsfiZ21llb/0cJc
 7+fv1Bz37tAcIXls=
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr37140995wma.163.1669651133800; 
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6sDt2/YarcW5Yi5WbLGw0L8xMd/mn3Vr3VhWcN5EaeaIIBHL6gDN9k9OjR2uPHGYGYYDZFlg==
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr37140957wma.163.1669651133599; 
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
Received: from localhost ([31.4.242.188]) by smtp.gmail.com with ESMTPSA id
 u22-20020a7bc056000000b003c6c1686b10sm18924790wmc.7.2022.11.28.07.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:58:53 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  Alistair.Francis@wdc.com,
 bin.meng@windriver.com,  palmer@dabbelt.com,
 marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 yuval.shaia.ml@gmail.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 dgilbert@redhat.com,  pavel.dovgaluk@ispras.ru,  alex.bennee@linaro.org,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 mrolnik@gmail.com,  gaosong@loongson.cn,  yangxiaojuan@loongson.cn,
 aurelien@aurel32.net,  jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com,  berrange@redhat.com,  thuth@redhat.com,
 lvivier@redhat.com,  suhang16@mails.ucas.ac.cn,  chen.zhang@intel.com,
 lizhijian@fujitsu.com,  stefanha@redhat.com,  qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,  virtio-fs@redhat.com,  Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 2/3] block/vmdk: Simplify vmdk_co_create() to return
 directly
In-Reply-To: <20221128094138.2824623-3-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 28 Nov 2022 10:41:37 +0100")
References: <20221128094138.2824623-1-armbru@redhat.com>
 <20221128094138.2824623-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 28 Nov 2022 16:58:51 +0100
Message-ID: <877czfkr44.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Nov 2022 15:59:00 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

goto, uninitialized variable at declaraton and can use return directly.
Not bad at all.


