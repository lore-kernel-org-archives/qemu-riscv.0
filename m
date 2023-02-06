Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOz9k-0006Rj-C3
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pOz9j-0006RQ-9y
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 05:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pOz9h-00076p-QH
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 05:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675680924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+vd8a3YNLOVyD4fOqsiPRV4nlAqGJMUnaszJ4jFS0c=;
 b=AaDSZeMxyn/3XqsTH+jb8FjkYd2MtNeIHph2tvXdpnJYw8pW3AQx6ZVjj5dXMLGCdJ0z36
 6aGvWIJ1ZbE/sCvTzSPYuVFrRkTJDul04lYoYXSaxmDuq/oKPNZhGnIbTL3FjpohoHxKOS
 y73DTKYdC3Q0OUFPdoGWH/ZaUWAGTNM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-jKjGkbifPlyjf8aKSsCo-A-1; Mon, 06 Feb 2023 05:54:19 -0500
X-MC-Unique: jKjGkbifPlyjf8aKSsCo-A-1
Received: by mail-pg1-f197.google.com with SMTP id
 w6-20020a6556c6000000b004f340df037cso3574865pgs.22
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 02:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+vd8a3YNLOVyD4fOqsiPRV4nlAqGJMUnaszJ4jFS0c=;
 b=Hn04fgIlcMvXwzPvatd9jwi3AHDb7H239Pc2cW9zZrv9JMI9If6ObiBWR+tS+lzSt/
 TmDXG7XSfpKQ6gzwmL4EiwYssfiBsSDPGCoCNbosfYa4Sqq6SKs2A2T+8E3KT2MW9zZ2
 cJ3bT1Rwt3zzxEmJdRW8YJABlOkLoYZXBq1NhTtHZEmvNaJOS53nhJMLeUTkSCDPPZo9
 cvQA5Pcnx2CJyyXUEYDHl6KQuZep55ifYvGZuI1EX6s++PuJBfhlGdv6FuFvihLHopMo
 ZSMgcebbVjcMOKPI9lZA4H1eOx4uRUqXdfIznpTyZilInRUimfBdwsESt8mZy/h5FstR
 1Aog==
X-Gm-Message-State: AO0yUKUUSwvWa6/UZPu5A+SV3Qu2/E6qcBjK72BoIFAc+ZTAJtJWQ/72
 ucYgJTx8RKNK/JILfn5FEmtSM9i7N7KMIknyg8cyC/sLxQwdAAYLddcvUgy1D+ADITcpbGQ4fsF
 6H1WcVRA/fkAejYYRrNIsvG/fAWVitLw=
X-Received: by 2002:a65:45c9:0:b0:477:31bc:348f with SMTP id
 m9-20020a6545c9000000b0047731bc348fmr2984410pgr.72.1675680857879; 
 Mon, 06 Feb 2023 02:54:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/PfGg99e65fX6/yIy48rzNfKGmY83luKzURQzAgeX2suGH56YiVeDdERsLJL6V5GVPEBlPXsTlZXaVCuQAw1I=
X-Received: by 2002:a65:45c9:0:b0:477:31bc:348f with SMTP id
 m9-20020a6545c9000000b0047731bc348fmr2984400pgr.72.1675680857553; Mon, 06 Feb
 2023 02:54:17 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Feb 2023 02:54:16 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230202045223.2594627-3-sunilvl@ventanamicro.com>
Date: Mon, 6 Feb 2023 02:54:16 -0800
Message-ID: <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
X-List-Received-Date: Mon, 06 Feb 2023 10:55:27 -0000

On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> +    object_class_property_add(oc, "acpi", "OnOffAuto",
> +                              virt_get_acpi, virt_set_acpi,
> +                              NULL, NULL);
> +    object_class_property_set_description(oc, "acpi",
> +                                          "Enable ACPI");

The way this works on other architectures (x86_64, aarch64) is that
you get ACPI by default and can use -no-acpi to disable it if
desired. Can we have the same on RISC-V, for consistency?

-- 
Andrea Bolognani / Red Hat / Virtualization


