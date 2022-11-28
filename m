Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozgXh-0003ES-Jz
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 10:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgXg-0003DU-93
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 10:59:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozgXe-00066h-Vg
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 10:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669651173;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1IzXla6DDb3kJifsStnlw4Qa7gNI9PODBtyiQ/YSzk=;
 b=CZmDQfRngwvmOyLuYae7syfJMhHmrak3XCPuOk+rTlIO3pyQOC2stg9tW96yep2tjyto0a
 T/vtMoNyXVOuQYCusPRgnQOASaYC1S7ayaokAOc6Zc9cqQGYidCBiOT7LgjID0zEnPUylD
 03YYMoP2mdr/gWsBHMk5J2PDXUTxDQ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-4pKZg5lgNNCFsrVG4h-I8w-1; Mon, 28 Nov 2022 10:59:30 -0500
X-MC-Unique: 4pKZg5lgNNCFsrVG4h-I8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 e19-20020adfa453000000b0024209415034so1334401wra.18
 for <qemu-riscv@nongnu.org>; Mon, 28 Nov 2022 07:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1IzXla6DDb3kJifsStnlw4Qa7gNI9PODBtyiQ/YSzk=;
 b=X2OEEOnuto8xU5ZTGdVCc1IY7j3VX7AFMoJ0I48a/qC7kcLTi/MVhAt+6i6vWLL8MD
 3pltcG/Y0uXGrwEy+c8oDhQRjtk2E9uFs8lUF8XSBC2Be64qY96CgAu7d8Bfk1rfJF8M
 V+l+RLAJTLmkqqvyU2LSFQCkEOP/HODWlDCyEMHV0LudxwamTlV524Hh7MRcjMiw5wOQ
 7PePW1Qkb8Gtqi7/nuNdOrJeGacVjGYH6C4Tk6jK4NGz1Xcv8MN9WLu+bko6DEpXHR8A
 i3ymX67UmUS8RAbORq8FuyOQLAyeiFM/Dtw/6lDpiOQWmocYX0m/nyJP+O0oLQqSzWVj
 32Vg==
X-Gm-Message-State: ANoB5pmaE96k0IEs/RWaeXTt+qpklNYrTPVUvcxK6NSy/hpp4fYpMZpY
 CtTql32bYMUxVULiyfDSg8xW7EyOmaPs1uP2ffYcu6AO880TnBdItDenPOk7AuzGG3roB22+uqB
 w50kaXt4dVId6RmU=
X-Received: by 2002:adf:ed01:0:b0:241:b4cc:4e9e with SMTP id
 a1-20020adfed01000000b00241b4cc4e9emr20798392wro.287.1669651168993; 
 Mon, 28 Nov 2022 07:59:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4OYViHyloJT8wO2lk37YjauITxsemI5W1bX5ZkalWXYJlfkWYuNcq4Xj9CUpcvq3NkKcVeGA==
X-Received: by 2002:adf:ed01:0:b0:241:b4cc:4e9e with SMTP id
 a1-20020adfed01000000b00241b4cc4e9emr20798373wro.287.1669651168767; 
 Mon, 28 Nov 2022 07:59:28 -0800 (PST)
Received: from localhost ([31.4.242.188]) by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b003c6b874a0dfsm20387267wms.14.2022.11.28.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:59:28 -0800 (PST)
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
 qemu-ppc@nongnu.org,  virtio-fs@redhat.com,  BALATON Zoltan
 <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 3/3] ppc4xx_sdram: Simplify sdram_ddr_size() to
 return directly
In-Reply-To: <20221128094138.2824623-4-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 28 Nov 2022 10:41:38 +0100")
References: <20221128094138.2824623-1-armbru@redhat.com>
 <20221128094138.2824623-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 28 Nov 2022 16:59:25 +0100
Message-ID: <8735a3kr36.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
X-List-Received-Date: Mon, 28 Nov 2022 15:59:36 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


