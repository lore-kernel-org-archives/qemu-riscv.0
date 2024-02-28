Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4C7C47DD9
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 12:13:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rfIoj-00005K-Om; Wed, 28 Feb 2024 07:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfHqn-0004Wh-Jr
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 06:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfHqh-0003dj-Ix
 for qemu-riscv@nongnu.org; Wed, 28 Feb 2024 06:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709118702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ack6zNbnh8xE4SclRkELehl4jVXWEmz1PFTXghcdvPU=;
 b=a8+s0VF8K/AQ69kcOHaxAV6Pao+7h49UuxaJLlabUkOMhyBuLVhh+vcs0tj5dXGF9G3XrZ
 ULs8OeFv8EN6B6wtJIV+26iJGGoLHBwrOuhsh01nHetZaAMv6u/ewONbarDZpfh8QvgehZ
 forGom89f/1sOAcKHtVEOZh/obRevRc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-kBVVOz9CORqHTRxZhwQ22A-1; Wed, 28 Feb 2024 06:11:41 -0500
X-MC-Unique: kBVVOz9CORqHTRxZhwQ22A-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6e52e3fdbdcso2208165b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Feb 2024 03:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709118700; x=1709723500;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2lOLvQEZPB1lbfugTDm65SThgR95YqYFdALlm5pPhSg=;
 b=hb+nTglGaCn685+XibfZwcHSsNxrxrVlqypmjhQLAx6FAFrClUzWe5pVf73gA74u68
 rSLWLxaCZq/XmYPqrJE3EczxiDkum7nIt7qXqCWx+t8ODnvl6c5+QrzjJ6cX/WFfuEYi
 X9Mz0S5lU8ZV5aU6hezvjPCgojKOei0tl1h4puX3Pf/MYk1PEhLSlzrYi07LEIaiZo6Q
 ChPXpAz9nqOOea3Emzz768Y0UGGLS22y7LsI+3n3yjb3hv1KBo+D9Eoc7m2aEuOKXwxo
 v9EOWwTUa8c+KLby6scNChyvKzjYMMkP3P80lqPW//vw+GtGcYX0QEVbJStGg1M0ZTvv
 v4BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI9Z2rvZC+soMXYPSadEI944CmCjtJeVtJPvMOCuR8EkHz2TEjSiHuhyBSHDBkksjkedJTPNbjKFTMbCcypGO+hyamgzM=
X-Gm-Message-State: AOJu0Yzi45AOPjGYQNvhGa38OgmBRnBCZKaMNINhT75eGbyvjxMMuXjo
 adI34wmlOHLyVjxbFBZhkxMFbg5pbYSOAJKQn5wmVWxoB4RPVFUMcTgZd9q/TM4U15h0LcMi9WF
 zbPFB9j+tJ4MP6QinlgNVvbduYwnATmDn0D7hmi7+FgMKRjPEKps5
X-Received: by 2002:a05:6a21:3189:b0:19e:9da6:c73b with SMTP id
 za9-20020a056a21318900b0019e9da6c73bmr5592107pzb.8.1709118700274; 
 Wed, 28 Feb 2024 03:11:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa3DeAlNGReFF/gK8vnRupXIRArcxc9Iv+ZMGtHnGA/xQZVw8Zm/aUw6O/FEB6KZDwAZPzaQ==
X-Received: by 2002:a05:6a21:3189:b0:19e:9da6:c73b with SMTP id
 za9-20020a056a21318900b0019e9da6c73bmr5592083pzb.8.1709118699932; 
 Wed, 28 Feb 2024 03:11:39 -0800 (PST)
Received: from smtpclient.apple ([115.96.143.215])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902a50700b001dcc2951c02sm1824254plq.286.2024.02.28.03.11.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:11:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 03/19] tests: smbios: add test for legacy mode CLI options
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-4-imammedo@redhat.com>
Date: Wed, 28 Feb 2024 16:41:22 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <4AD7C30D-F989-4228-91FD-672D79592302@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-4-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Feb 2024 07:12:33 -0500
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> Unfortunately having 2.0 machine type deprecated is not enough
> to get rid of legacy SMBIOS handling since 'isapc' also uses
> that and it's staying around.
>=20
> Hence add test for CLI options handling to be sure that it
> ain't broken during SMBIOS code refactoring.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> tests/data/smbios/type11_blob.legacy | Bin 0 -> 10 bytes
> tests/qtest/bios-tables-test.c       |  17 +++++++++++++++++
> 2 files changed, 17 insertions(+)
> create mode 100644 tests/data/smbios/type11_blob.legacy
>=20
> diff --git a/tests/data/smbios/type11_blob.legacy b/tests/data/smbios/typ=
e11_blob.legacy
> new file mode 100644
> index 0000000000000000000000000000000000000000..aef463aab903405958b0a85f8=
5c5980671c08bee
> GIT binary patch
> literal 10
> Rcmd;PW!S(N;u;*n000Tp0s;U4
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index a116f88e1d..d1ff4db7a2 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2106,6 +2106,21 @@ static void test_acpi_pc_smbios_blob(void)
>     free_test_data(&data);
> }
>=20
> +static void test_acpi_isapc_smbios_legacy(void)
> +{
> +    uint8_t req_type11[] =3D { 1, 11 };

Ok so looking at the code, it won=E2=80=99t let you specify smbios type oth=
er than 1 =E2=80=A6

See the following in smbios_set_defaults()

  if (smbios_legacy) {
        g_free(smbios_tables);
=09/* in legacy mode, also complain if fields were given for types >1 */
        if (find_next_bit(have_fields_bitmap,
=09                  SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
            error_report("can't process fields for smbios "
                         "types > 1 on machine versions < 2.1!");
            exit(1);
        }
    } else {

BUT you lets you load a blob of type 11? Is that a bug in QEMU? Should we a=
lso add a similar check for have_binfile_bitmap?=20

> +    test_data data =3D {
> +        .machine =3D "isapc",
> +        .variant =3D ".pc_smbios_legacy",
> +        .required_struct_types =3D req_type11,
> +        .required_struct_types_len =3D ARRAY_SIZE(req_type11),
> +    };
> +
> +    test_smbios("-smbios file=3Dtests/data/smbios/type11_blob.legacy "
> +                "-smbios type=3D1,family=3DTEST", &data);
> +    free_test_data(&data);
> +}
> +
> static void test_oem_fields(test_data *data)
> {
>     int i;
> @@ -2261,6 +2276,8 @@ int main(int argc, char *argv[])
>                            test_acpi_pc_smbios_options);
>             qtest_add_func("acpi/piix4/smbios-blob",
>                            test_acpi_pc_smbios_blob);
> +            qtest_add_func("acpi/piix4/smbios-legacy",
> +                           test_acpi_isapc_smbios_legacy);
>         }
>         if (qtest_has_machine(MACHINE_Q35)) {
>             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> --=20
> 2.39.3
>=20


