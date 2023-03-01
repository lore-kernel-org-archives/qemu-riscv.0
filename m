Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXN9X-0007HH-2e
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 09:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN9U-00071S-O8
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:09:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN9T-00069o-78
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SL4Mx1u9PRTtlDNjVCwdJnpam7mtkh6o1cTY3iQw2tk=;
 b=f1amXLibcqM3k/ATAyiUmK/2bt/w0l3/t0Wl/49dH+cWxsJ1EdL9O5CLSlNLDQ766MNSHk
 RZnsyoT7iW3eCrkWBi933UUVAL2F3uy3E1IBp3+Od7eZ9FQrvhP/FLl9o8SmOSdIiqJUOl
 bpEeaVskrW30TXwhP5BosyIkbn19AhI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-fjy-hQctMyK37nVr1Cnz_g-1; Wed, 01 Mar 2023 09:09:44 -0500
X-MC-Unique: fjy-hQctMyK37nVr1Cnz_g-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020adfa782000000b002ca9ab26627so2357291wrc.23
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 06:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SL4Mx1u9PRTtlDNjVCwdJnpam7mtkh6o1cTY3iQw2tk=;
 b=RKdRIcIN6yS5XKCI0liN20Gx5Z8t06PZHUM+6WLGqP8nYSjmqOpeS1vIKjMTD7yJis
 DK6xlfksoixKT+u2dYhbwi0uJxYdh52zGYVi2YXs85xCyJxvt1IGSCeEpX9gnYyXdfM+
 YWoIbV7oAqgJwnwTplj9O9o3u93oXUGsy541fcAWwArOV1LkNh3aOHJEJFtZRLuT6gKw
 iysJ5RkzdE6p4QB/z0aWNWlRQOdId8vq/Q8aATZW9pzvndcwMy+A0yJVHFRQKPPnaPRu
 jCcI51Y4B6gag/JOxanfrmP2CakvgLTCZn4V3VWqOYzCy5/IcJ9+iBNIn9orbtvGwlQi
 chmA==
X-Gm-Message-State: AO0yUKXT6qtAODLN3FilTttdkE5YnPwofiVs2oIv2ePqfpaKWfWeJ6w2
 ryGTh4LmD5R6i1g/QUWV4pCjpdh3/AgIZtOTmRH3SoIEwOIPs8H5J2nwvkoOqomlwzYWU1C36xq
 ZlNoLFSWZAsS+zMg=
X-Received: by 2002:a05:600c:3b28:b0:3eb:2da4:f304 with SMTP id
 m40-20020a05600c3b2800b003eb2da4f304mr4948054wms.17.1677679778525; 
 Wed, 01 Mar 2023 06:09:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+JjkH2QX2s1dKiuPa/rwahv7emFvz50oMOBPmNFlBgi63pzcSAf4dMY9wzD6PSd04d6NlUEg==
X-Received: by 2002:a05:600c:3b28:b0:3eb:2da4:f304 with SMTP id
 m40-20020a05600c3b2800b003eb2da4f304mr4948043wms.17.1677679778223; 
 Wed, 01 Mar 2023 06:09:38 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n33-20020a05600c502100b003e8dc7a03basm20209830wmr.41.2023.03.01.06.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:09:37 -0800 (PST)
Date: Wed, 1 Mar 2023 15:09:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 05/19] hw/core/numa: Set QDev properties using QDev API
Message-ID: <20230301150936.1eaf5697@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-6-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-6-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
X-List-Received-Date: Wed, 01 Mar 2023 14:09:53 -0000

On Fri,  3 Feb 2023 19:09:00 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/numa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index d8d36b16d8..9b6f9848e3 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -34,6 +34,7 @@
>  #include "qapi/opts-visitor.h"
>  #include "qapi/qapi-visit-machine.h"
>  #include "sysemu/qtest.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "migration/vmstate.h"
> @@ -740,8 +741,7 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceS=
tate *dev, Error **errp)
>          /* due to bug in libvirt, it doesn't pass node-id from props on
>           * device_add as expected, so we have to fix it up here */
>          if (slot->props.has_node_id) {
> -            object_property_set_int(OBJECT(dev), "node-id",
> -                                    slot->props.node_id, errp);
> +            qdev_prop_set_int32(dev, "node-id", slot->props.node_id);

broken, see cover letter reply

>          }
>      } else if (node_id !=3D slot->props.node_id) {
>          error_setg(errp, "invalid node-id, must be %"PRId64,


