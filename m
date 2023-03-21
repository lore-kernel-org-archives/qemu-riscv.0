Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peaMa-0003up-2N
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 07:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1peaMW-0003of-NY; Tue, 21 Mar 2023 07:41:08 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1peaMV-0000z1-68; Tue, 21 Mar 2023 07:41:08 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id c1so10357560vsk.2;
 Tue, 21 Mar 2023 04:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679398865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fa1FmQz+Gnj39PVW2EHA+Up8zW8xVa/wCLIEzglKi/I=;
 b=PhpzinYo1QWzrgNqH9q1LY2sgSvyohB8XRtQBGroX2CF8tTRYlkihVpBBF0+wxUHe0
 QNBWUuYBEd9F2LU6BJSCQQsVQozawQhENiJ76j6K2JD0YPtvAR22i8m8oNRiFig03Rxn
 SfgMaP1UGm60DNlmTcAlOVLOpNtTdHyYhcxHvj+ksOYemRYRCe1nfk50wKawdteQ3bVA
 j05Qglyuxt5QaZsWJt6ggcWCJBxdL0hLO8kh7kQs6OalIFOA341RqCyTjo+UCD/f3C0U
 8vSvHItbrvUZHDxV9CQnJQRimdGqPIDX6Ng2j7FZnSo2YTrlY0Ya4O77E22KLYYALtQj
 YaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679398865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fa1FmQz+Gnj39PVW2EHA+Up8zW8xVa/wCLIEzglKi/I=;
 b=z5xp+l9k0vCFN8/eRn/lqzb14dzk9RQRmHzPJwAj1tnrfaJNRPlrC8bRuQaEqXfhG3
 gm0L/ST4sVo+wTn735cW47LzOblxFGukZkeC6q8AsV0r1RKrxeTo40OXBVuVeZhaTpcm
 ZuQZ9tbA2VrreDLbhQnCu77NO6ldGoS28Yn2DKshMtb4+XSm4hsy3rf/wAU5uAaMN5wG
 leGF0kGhY1Rn6tjc1/dHN4JTIf4VTqPiGXBHLjwZfpx5NANsuoyirvYWkRr1s0gUdpiI
 qPOfoZzPPQEhEUTZsxRjnf9aVrd0lS69HArDSk8Y55mycmDEQPVW4EZGKXNyQG02idyW
 nESw==
X-Gm-Message-State: AO0yUKWzoLJw3BykSEylkoqCKZ65PnwRptaqABrfrH4LRlHCZqGN3mn3
 onPPQperQOlrLYrQs7zNCsDeS9mlwYZwf0xbI5U=
X-Google-Smtp-Source: AK7set8i2k+RecVNC4HqVtL5sL/USGoR8w9rt11ysOmLMpokN7eYpNT/g/4xozA5lYMu2KUSw3cukBBGuLhw+FOaLgw=
X-Received: by 2002:a67:e005:0:b0:425:87ab:c386 with SMTP id
 c5-20020a67e005000000b0042587abc386mr1292861vsl.3.1679398865395; Tue, 21 Mar
 2023 04:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230317062542.61061-1-gshan@redhat.com>
 <20230317062542.61061-4-gshan@redhat.com>
In-Reply-To: <20230317062542.61061-4-gshan@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Mar 2023 21:40:39 +1000
Message-ID: <CAKmqyKMBWh6GjSSOE0W7+OafcucXeNOcM3U2H2tC3kkhAr8F3w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hw/riscv: Validate cluster and NUMA node boundary
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, imammedo@redhat.com, ajones@ventanamicro.com, 
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Tue, 21 Mar 2023 11:41:09 -0000

On Fri, Mar 17, 2023 at 4:29=E2=80=AFPM Gavin Shan <gshan@redhat.com> wrote=
:
>
> There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
> Both of them are required to follow cluster-NUMA-node boundary. To
> enable the validation to warn about the irregular configuration where
> multiple CPUs in one cluster has been associated with multiple NUMA
> nodes.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 2 ++
>  hw/riscv/virt.c  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a584d5b3a2..4bf783884b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -349,6 +349,8 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv.spike.ram";
>  }
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..84a2bca460 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1678,6 +1678,8 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv_virt_board.ram";
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
> --
> 2.23.0
>
>

