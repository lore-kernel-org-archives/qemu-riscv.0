Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMLXv-0007rt-F2
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 23:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXu-0007rW-2z
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 23:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLXs-0001KK-TK
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 23:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052008;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=ifGInZyx3OIJ+vpVzIdaISABuVYG9R1VhWyt8k4Um65+QdkTC8VaG2bps8wm0pJvafZ6cz
 yDhcW3/1k8R3AWX3TMcfWNHR5SXEM7WRcn9deo77pNcJ0wlqUc7FKkIg/L/YWNkA/qXyMU
 WFqUjAsucDxAkpQw6THesp2JjWC+WmU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-nyWryWrUPeOpukQ7z2q1DA-1; Sun, 29 Jan 2023 23:13:25 -0500
X-MC-Unique: nyWryWrUPeOpukQ7z2q1DA-1
Received: by mail-wm1-f70.google.com with SMTP id
 z22-20020a7bc7d6000000b003daf671f7b2so3759847wmk.9
 for <qemu-riscv@nongnu.org>; Sun, 29 Jan 2023 20:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8LlpqFMBZVRcZHC0EnU984o9h8pM2ZpA8U/VQuUvn0=;
 b=wobmI4pkm59b4eT2saA1ef+iUF401VXZ5kxtQxNLzq2wcs7jFolij5qO3QjXRjWBiS
 zBoCG/epIvdoKle1hK38fvW2Y2/a+LPpb1X1H2H+hQy+64YF0YuAr0+yuC4L7mL3Eeid
 EgTdnBfmt18G/GQGrjwbPfT+H3bBosfn94TJpHB+7vgz9wVojWhLBGt+8V0mIk5nH8j0
 5ciHIanevPmYiGRaurPqbpHnR5o6DP2MAPrjaih/v8URHoJpmCCrECT3pgKwNEWZeQYi
 OsNbu/4JiEr30YNjXxRb0yUXyKWbAWplQzmIbk6iU7fuxbqT1OxTQHQcHLKN373g9+k/
 zj9w==
X-Gm-Message-State: AO0yUKWJ+YS5fUX81a40OYYKQSk/79paPS8Y4viqELV9ePvaWCHsbIHf
 3TkPIrRcHIAlv2maruSdqiT9ezcoGr/ms2D+1sZb7doktMVw9Yoin97RhJ3MAwtqq/4JGp7qECR
 NSRzD1qj5VXJBI44=
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491288wmr.18.1675052004048; 
 Sun, 29 Jan 2023 20:13:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+XglkjkINPW4f9AT1zRF3CVQglpRm0o9aHj+JzjrACrSAbCWbRtNg/iugAEO1yWV5b8lh7ig==
X-Received: by 2002:a05:600c:b4d:b0:3dc:3f51:c697 with SMTP id
 k13-20020a05600c0b4d00b003dc3f51c697mr9491262wmr.18.1675052003885; 
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003db16770bc5sm3110464wms.6.2023.01.29.20.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:13:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 16/19] Fix non-first inclusions of qemu/osdep.h
In-Reply-To: <20230119065959.3104012-17-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:56 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-17-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Mon, 30 Jan 2023 05:13:22 +0100
Message-ID: <877cx4psm5.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-List-Received-Date: Mon, 30 Jan 2023 04:13:30 -0000

Markus Armbruster <armbru@redhat.com> wrote:
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


