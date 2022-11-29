Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0ARL-0005Mf-SZ
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 18:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1p0ARJ-0005M7-Vm; Tue, 29 Nov 2022 18:55:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1p0ARG-0003HN-Kf; Tue, 29 Nov 2022 18:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669766099; x=1701302099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oaICGjh9tTxkmHgli1xheTjeyyDA8NQWZ/Dr7f19q2c=;
 b=tA7nSfPrUnGT+QkCyenTFASJ8i3SwQM6r8jntiE2pyIgYwDC49yDSIE2
 AHcitbIGbFw+pz2hAtcvmQjNbjn0gZQdMS+1sjS849u5zgjkcbX1L7z8H
 oJY29gNGzJQ4+e9QE28un2yGekGAiz8bAK5cB7T9xmnxrhy7VDCL5nXvL
 FU9QAZUBgFBsIXKHDCpn581qzsd+XmWQ2JeYwB8WLjebhbRLVgtBAD8tu
 TKCLhpX2La/YLj7pnD69ld8DXEWmNVmD5kWyqDCvTrQjD7AyLPgBnyHtb
 yjFdA4Unoo6iPF7xoU2RCPi+ujDD0K6yRnKEUzOqTjO9SZLOKk1t8/Mj2 Q==;
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="185780657"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Nov 2022 16:54:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 16:54:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 16:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5UGWyGAJjqGN+dn7QOSkIyA5JcB96ni/MgCRPFJLF1gq1JIU/U4BtXQfIjRpVq2GHEt8LoeQ5Drd6WHR3JM7JjrkFJV8sEyRwND4tEZLEQ99CRElk333aJcju1cbsHQQWwqQxZthFZMVvX5lFVJZNt6QiwMISvIT1vFHcvOT0PXu5Hnsh/OpaWii8aXoJCrkfNjb4OpPZrs6jEYhdP/LT2IcCH5c3mcyBpPwfsvtdKqUG6oiiOe1gifs01s7AWQMOjK4gB1LUFrTd3CbPElUwvEnzIPJ1clg7tufm/Rs4UZqvjIlJuRg5uDT9dYY+967zlckgVt/mdUJshsmKdJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaICGjh9tTxkmHgli1xheTjeyyDA8NQWZ/Dr7f19q2c=;
 b=gNxcy7Ia7VA1xLdWp3kMxGw9gPcTxMaZcJfTwSk1/XO4+c+NTxxOwu5zz+m82lSNtmeJKZsP3YwAIDA+h2Nha0Ap2s7eTdHLLp9UgbOdcfMTcVIg8mIKRiOeOawhvPEvDdQcOVUbe3BwaxfKXUTNH31zTv1sqMbovnKle3qOkzT1HAHKOxOye5VBf+kQzcLGOs/AyaOpkcjGdgYVs8C/JUhoVnltxGbykWDpR9iksQzJmHxi4mH4Yg83S26BJtW25Pj3T/FiTMa0xkt7ilUTiT/u6j3kPKxRsWZ6Ug7JY1GFsjgO/643RzvVrzDhuUOABuDb4dCK5Xc8HLH8lrdefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaICGjh9tTxkmHgli1xheTjeyyDA8NQWZ/Dr7f19q2c=;
 b=T4EQDaAIR18O1+dSXGMTlrx09Bqm0EFYHfrcE9PP/jLRARRUW1nr+HTni4xifYyiSPxEd4RnnaUKTZtF7l1PFr9AqfjtgBIxlpw6yMTMnXwIWF/SphiJdAkKf++90fJ+tpdW2NdwdYK1Bs+kC8Qf2ALLPKi3ml+N/m+SMz2uyLU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 23:54:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 23:54:44 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@rivosinc.com>, <robh@kernel.org>
CC: <ajones@ventanamicro.com>, <qemu-devel@nongnu.org>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <palmer@dabbelt.com>,
 <qemu-riscv@nongnu.org>, <samuel@sholland.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKAgAAA1ICAAAftgIAApykAgAAGxoCAACAygIAABBsAgADuG4A=
Date: Tue, 29 Nov 2022 23:54:44 +0000
Message-ID: <0d83cbe9-bc8c-75da-e1a0-a4eb8b3824fd@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
 <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
 <b42e75c6-8c52-025e-35ef-326537ccc90b@microchip.com>
 <20221129070820.7varmruxjkhdwoc6@kamzik>
 <cd386574-b115-328e-c5db-6f85b6cf6c9e@microchip.com>
 <CAHBxVyEthq3q-C_dy0ZQ1rOGwTWUF8_rXG1_7AHRFKxk9q0D1w@mail.gmail.com>
 <41abdee4-8d33-193b-9b78-080c75a8fec1@microchip.com>
In-Reply-To: <41abdee4-8d33-193b-9b78-080c75a8fec1@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BL3PR11MB6484:EE_
x-ms-office365-filtering-correlation-id: a925138f-81f8-42db-3e1d-08dad26516d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTBbQ9gRjInWxtDZNKW1brVISUfI90RNByViCt1yoaf/VEknW64M6IDICgq873AViZPYxj5EWZMVXQy3PaEN8Tp/7rX6WoU6jnJBNJ/o7QHZrrW8VaRMg01iNj3DgiLeGmmCuIrJk+TPc/Kl1frLTQ6LBJ3GbLSRqqjLdDaUJd/fpEzbN/ALInVEFJTzLtrx2BhKGh029+CAyroZw19KaJV5hLUU33DEJa//a7e0fydeCv6bC0Myk2rULh7xq/N3aApZSldxmFuhfXrfT6gLmbWeBYqS0ge/EAkHAqS3XeC6Und0hSDy4V5ZuRoiuU7qCx5i2ydO0Mwpw3p6lqvyfRB34ODu13kfbeGwHCJ2lGLKzxjUGdIw9WTRrh+xxqHQiW+TsqokujKT6GYIYCuEHnH7b0a54T3D/wecszghStP/vfWiXRheO23kD5BW3kB6/9xl6F4owbzTDI8RKxxID1DcPlb5KADHhycXRysbkw2dT1eko4AH/0m6bcoc9hhsvJtnskc8barO+9yosgedQqCwIcwz0PYlNCk676SRU5MRiHRfimqSHOeUqhob2Xl3oaLfwu7BKIEqXU3ifHXOptv0d35U+wJlNdbCfhlxfe/umV9m9QZSysbbu6s7G3rkUTgoCmnCwiUBegWmJJp5ZlBkfAWZP65eaGeL3XkOzhxBAqbRfeBzabtWHjFhstrwuV1Bz6MJkVeu6QgY4I3hy9PSHiIjYo3ydwqOv2q3hJdjiUfkQ0ZUhileUra4wPTrUMBpYwOT/fCvcJnRT/sTQzYuL746oZ4mZh9QwLseTPkXAqd7d2y2V7mX+L5H+Sia/dXEvUl9rAZ8rl8MwEa34g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(66556008)(66476007)(8676002)(64756008)(5660300002)(31686004)(91956017)(66446008)(41300700001)(76116006)(110136005)(316002)(54906003)(8936002)(4326008)(66946007)(38100700002)(6506007)(26005)(478600001)(36756003)(122000001)(71200400001)(2906002)(53546011)(966005)(6486002)(186003)(2616005)(83380400001)(6512007)(86362001)(38070700005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmxJRDViUE5PQTRQN1djcFloNDBqRktaUHpyOG5VMTY4eFR5TnJiK2p3WFIz?=
 =?utf-8?B?cmZyd3dDd3cxd0t1RzlPWTMvdnpkL3dOdXc5dW5LRHZkb0R3ZTl0TDdqcFJX?=
 =?utf-8?B?M1pHZ05wajdxL0Z0RjMxWkNMdXk4YzREaEF4UGtYUFZMckRFN0lqT0U1QXZk?=
 =?utf-8?B?MzJud3RKMzUvdnFrcWdFWEpoc3MwNlpldmk2YkprTGY2MWxIOFpRRDRDZ2RX?=
 =?utf-8?B?ZDZqWExRZHFEZUhSd3NDNXpYNDJHZFRQakF4MS80eHNHbG5OWVRXakIxdHJJ?=
 =?utf-8?B?ckZVZDY4b1ptSXdQdUFqaFNPZHhram1xcHpYOG9RMXpZazA2ZGdJc3A3NCtS?=
 =?utf-8?B?UVFjVWdOaGV3TGUrSlhJV1VXM2JaRTlMY3ZjVzBMOFlUS0N5clgwUXR0U2RL?=
 =?utf-8?B?VlZQY0UvUllIQWIxcEpjR2lONFZBOUVhVkVDTUh6N0JqM1gvUVRodXp1eFhX?=
 =?utf-8?B?WkRQL0NNRmVOTjZWa1FoRW55N2R1anliN0RjQmI5d3l4d0VLUDVHRjZsUkZW?=
 =?utf-8?B?RUlVckM1eWJzVDhFQkxsVUxZYWV3VWNsSEV1R0NxdHd1bHoyY1FxYnYxRms1?=
 =?utf-8?B?ZFZTRVh4dDExQWYybVNBZVBkMkxQNGtXaVE0SHhzY1BhNkUrNmh5cnd2QWtn?=
 =?utf-8?B?UjZ3bjFPWHNpTkxBZXhuUStmbG5LcXZoWFJ0SXpVc0d3VjZPWFUycTF0akFi?=
 =?utf-8?B?dnZXWU10OUFCQUlSUVlUdWFFdnZ1YWhjbldyWTFrL3Q2WVJnN3Q4QXRJQkFh?=
 =?utf-8?B?dEFiTFpybTQvRmNaVHV5bll6Z1NtS3JnOE9iUTRDcGZRTjh4Mmk2bGZ6UXZC?=
 =?utf-8?B?ZE5GQTVmTUllU25NUHB0b3hvSHpwTTJpQTdmekMveVFZQ0FmMHNFdGFVMmNV?=
 =?utf-8?B?Rm9rc0hKVEZQblZRcFVYbC9xbjdzT2VVdE9PYldoRkRFYjJpNEdkMjVndXBW?=
 =?utf-8?B?cEhZa3JOVXlGUTQzU2FwYWZVb2RnSU5jWllXRW9VdDJBbFRBaStSNjlaTHMr?=
 =?utf-8?B?NmgzblEzcWYwRkZpdWNsekJubkhsVU5xMzkrNzRRcWFDelhFNnFOalBFdmtk?=
 =?utf-8?B?ZVRiYzRKRmhsQVBpY0pqSzdVSkJmb09BZ0E5cU9ReEJSb0JJL3hEbm5GOGQx?=
 =?utf-8?B?VVhVOFgxZVMrUUtFY1c4blJJbVJiVmNwaXB1MXhoSy9FRVVmdWhoR0tUd1o0?=
 =?utf-8?B?N3YzcHdEZ3I4K2FYNFNWem1iSFlQWVdHYWxvY0plcFJZNWU0cTJHZDl5cjE1?=
 =?utf-8?B?ZElpcktlTVBPYUY3SG9RUTBxUUtaT1NjeEFpZURjaHNtMmJ4QlNjSTk0NEs2?=
 =?utf-8?B?YlBvTlVadCtudXNYS2p0ZDczdnZvZkV0T3ZNSjdDRFViQkIwUy9aQmlteUZC?=
 =?utf-8?B?bi9VZWhHUTZQU3NzRmNGS3FueWNqd3Ria2l1d0tVbHY4OVAzRElyMVJOTzdh?=
 =?utf-8?B?blU5Y2VBQ2IyV3pIS0UrM2YySFBtemt0SWxGWTBmWUJYenROMGhoYnJwTnUy?=
 =?utf-8?B?MDBoTk1rVjdQMnpPS3BSVHpTdjVrWHJOL1ZUZnhLL3hqeG1MQnNCeERSeWE5?=
 =?utf-8?B?b0FHZmVQdXZPbnBka216RHN4OFRZWGdLSy9FOHlJakpCVHBXV1RXaUdUSHIw?=
 =?utf-8?B?eENRV2ZpVThVT01TODlJS2Exdnp1M3pmTVNpV09SbERCKzQxQXVRYzJ5R3Zz?=
 =?utf-8?B?ZFpaeW1uVTIwSURwSENyTFlsc2cwcG5tVFY5NnZ3VllRNngzTXdZaFh1NzVv?=
 =?utf-8?B?NEZCaGhNSWFQZzNjZTBaeERNQXJzZFE1WFFNZksyOGc1Smh1YTF2U29VUDA4?=
 =?utf-8?B?UUlmaEIxYStsV0lGSVdEb3Vmc2VoN1ozRGhaYm44dDk0c3RRVk56cHU3MDlo?=
 =?utf-8?B?d1hIYlV4bmk1a2Q2aUQxVVFScUtDQ1BKMlN0ajFJTEdvR1YrNUthaUFNNjRq?=
 =?utf-8?B?WWpwVXNVWVV3N0xWZkJqRVNvZVVqcGtkZE12YTRteDJxVGRrbDhoUkVJSW9E?=
 =?utf-8?B?c2EySFJoZGYyNFY3WExJYk5Ib0JBeHRWNE1MdHArbGdJMFpLQzV4R3MxNERQ?=
 =?utf-8?B?TWxyQm1MRktoWVBSZGd2azYyYVBKbTFiZW1UUlM1MVZ5bmJvbldaSWxrTnF5?=
 =?utf-8?B?RGNOL21WWjNGbG1nTDRRcHpHRXpxeFNDUmJTSDgvRVIzdU93RTRReGtyYldt?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <536D71CF6FD61B499796B26639C291E4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a925138f-81f8-42db-3e1d-08dad26516d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 23:54:44.2481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xx9rzytta+KbJ7+e0q/CjAJpl3mCfchrX1QG9wcTAQ/fk/u6Q6QrNf/jzDBC/m2JHoyhEFGrFlj6q8KaSgyGEJVBw3/KySTKFgVkEN1480U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
Received-SPF: pass client-ip=68.232.154.123;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 29 Nov 2022 23:55:02 -0000

K0NDIFJvYiwgd2hpY2ggSSBwcm9iYWJseSBzaG91bGQndmUgZG9uZSBlYXJsaWVyLCBzbw0KY29u
dGV4dCBhbGwgcHJlc2VydmVkDQoNCk9uIDI5LzExLzIwMjIgMDk6NDIsIENvbm9yIERvb2xleSB3
cm90ZToNCj4gT24gMjkvMTEvMjAyMiAwOToyNywgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+DQo+PiBPbiBNb24sIE5vdiAy
OCwgMjAyMiBhdCAxMTozMiBQTSA8Q29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOg0K
Pj4+DQo+Pj4gT24gMjkvMTEvMjAyMiAwNzowOCwgQW5kcmV3IEpvbmVzIHdyb3RlOg0KPj4+PiBF
WFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4NCj4+Pj4gT24gTW9uLCBOb3Yg
MjgsIDIwMjIgYXQgMDk6MTA6MDNQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20g
d3JvdGU6DQo+Pj4+PiBPbiAyOC8xMS8yMDIyIDIwOjQxLCBBdGlzaCBLdW1hciBQYXRyYSB3cm90
ZToNCj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+Pg0KPj4+
Pj4+IE9uIE1vbiwgTm92IDI4LCAyMDIyIGF0IDEyOjM4IFBNIDxDb25vci5Eb29sZXlAbWljcm9j
aGlwLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIDI4LzExLzIwMjIgMjA6MTYsIEF0
aXNoIEt1bWFyIFBhdHJhIHdyb3RlOg0KPj4+Pj4+Pj4gT24gVGh1LCBOb3YgMjQsIDIwMjIgYXQg
NToxNyBBTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToN
Cj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IE9uIFdlZCwgQXVnIDI0LCAyMDIyIGF0IDAzOjE3OjAwUE0g
LTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOg0KPj4+Pj4+Pj4+PiBRZW11IHZpcnQgbWFjaGluZSBj
YW4gc3VwcG9ydCBmZXcgY2FjaGUgZXZlbnRzIGFuZCBjeWNsZS9pbnN0cmV0IGNvdW50ZXJzLg0K
Pj4+Pj4+Pj4+PiBJdCBhbHNvIHN1cHBvcnRzIGNvdW50ZXIgb3ZlcmZsb3cgZm9yIHRoZXNlIGV2
ZW50cy4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gQWRkIGEgRFQgbm9kZSBzbyB0aGF0IE9wZW5T
QkkvTGludXgga2VybmVsIGlzIGF3YXJlIG9mIHRoZSB2aXJ0IG1hY2hpbmUNCj4+Pj4+Pj4+Pj4g
Y2FwYWJpbGl0aWVzLiBUaGVyZSBhcmUgc29tZSBkdW1teSBub2RlcyBhZGRlZCBmb3IgdGVzdGlu
ZyBhcyB3ZWxsLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gSGV5IEF0aXNoIQ0KPj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4gSSB3YXMgZmlkZGxpbmcgd2l0aCBkdW1waW5nIHRoZSB2aXJ0IG1hY2hpbmUgZHRi
IGFnYWluIHRvZGF5IHRvIGNoZWNrDQo+Pj4+Pj4+Pj4gc29tZSBkdC1iaW5kaW5nIGNoYW5nZXMg
SSB3YXMgbWFraW5nIGZvciB0aGUgaXNhIHN0cmluZyB3b3VsZCBwbGF5DQo+Pj4+Pj4+Pj4gbmlj
ZWx5IHdpdGggdGhlIHZpcnQgbWFjaGluZSAmIEkgbm90aWNlZCB0aGF0IHRoaXMgcGF0Y2ggaGFz
IGludHJvZHVjZWQNCj4+Pj4+Pj4+PiBhIG5ldyB2YWxpZGF0aW9uIGZhaWx1cmU6DQo+Pj4+Pj4+
Pj4NCj4+Pj4+Pj4+PiAuL2J1aWxkL3FlbXUtc3lzdGVtLXJpc2N2NjQgLW5vZ3JhcGhpYyAtbWFj
aGluZSB2aXJ0LGR1bXBkdGI9cWVtdS5kdGINCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IGR0LXZhbGlk
YXRlIC1wIC4uL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9jZXNz
ZWQtc2NoZW1hLmpzb24gcWVtdS5kdGINCj4+Pj4+Pj4+PiAvaG9tZS9jb25vci9zdHVmZi9xZW11
L3FlbXUuZHRiOiBzb2M6IHBtdTogeydyaXNjdixldmVudC10by1taHBtY291bnRlcnMnOiBbWzEs
IDEsIDUyNDI4MSwgMiwgMiwgNTI0Mjg0LCA2NTU2MSwgNjU1NjEsIDUyNDI4MCwgNjU1NjMsIDY1
NTYzLCA1MjQyODAsIDY1NTY5LCA2NTU2OSwgNTI0MjgwLCAwLCAwLCAwLCAwLCAwXV0sICdjb21w
YXRpYmxlJzogWydyaXNjdixwbXUnXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUn
OiAnb2JqZWN0J30NCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgRnJvbSBzY2hlbWE6IC9o
b21lL2Nvbm9yLy5sb2NhbC9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL2R0c2NoZW1hL3Nj
aGVtYXMvc2ltcGxlLWJ1cy55YW1sDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBJIGFzc3VtZSB0aGlz
IGlzIHRoZSBhZm9yZW1lbnRpb25lZCAiZHVtbXkiIG5vZGUgJiB5b3UgaGF2ZSBubyBpbnRlbnRp
b24NCj4+Pj4+Pj4+PiBvZiBjcmVhdGluZyBhIGJpbmRpbmcgZm9yIHRoaXM/DQo+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJdCBpcyBhIGR1bW15IG5vZGUgZnJvbSBMaW51eCBrZXJuZWwg
cGVyc3BlY3RpdmUuIE9wZW5TYmkgdXNlIHRoaXMNCj4+Pj4+Pj4+IG5vZGUgdG8gZmlndXJlIG91
dCB0aGUgaHBtY291bnRlciBtYXBwaW5ncy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQXllLCBidXQgc2hv
dWxkIGl0IG5vdCBoYXZlIGEgYmluZGluZyBhbnl3YXksIHNpbmNlIHRoZXkncmUgbm90DQo+Pj4+
Pj4+IG1lYW50IHRvIGJlIGxpbnV4IHNwZWNpZmljPw0KPj4+Pj4+Pg0KPj4+Pj4+IEl0IGlzIGRv
Y3VtZW50ZWQgaW4gT3BlblNCSS4NCj4+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29m
dHdhcmUtc3JjL29wZW5zYmkvYmxvYi9tYXN0ZXIvZG9jcy9wbXVfc3VwcG9ydC5tZA0KPj4+Pj4+
DQo+Pj4+Pj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgYW55IG5vbi1MaW51eCBzcGVjaWZpYyBE
VCBub2RlcyBzaG91bGQgYmUgcGFydA0KPj4+Pj4+IG9mIExpbnV4IERUIGJpbmRpbmcgYXMgd2Vs
bCA/DQo+Pj4+Pg0KPj4+Pj4gSSB0aG91Z2h0IHRoZSBwb2ludCB3YXMgdGhhdCB0aGV5IHdlcmUg
Km5vdCogbWVhbnQgdG8gYmUgbGludXggc3BlY2lmaWMsDQo+Pj4+PiBqdXN0IGhhcHBlbmluZyB0
byBiZSBob3VzZWQgdGhlcmUuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBJJ20gbm90IHN1cmUgaWYgdGhl
cmUncyBhbiBvZmZpY2lhbCBwb2xpY3kgb24gd2hlcmUgRFQgbm9kZXMgc2hvdWxkIGJlDQo+Pj4+
IHNwZWNpZmllZCwgYnV0IGl0IGxvb2tzIGxpa2UgU2FtdWVsJ3Mgb3BpbmlvbiBpcyB0aGF0IHRo
ZXkgc2hvdWxkIGxpdmUNCj4+Pj4gaW4gdGhlIExpbnV4IGtlcm5lbCwgd2hldGhlciB0aGV5J3Jl
IHVzZWQgdGhlcmUgb3Igbm90IFsxXS4NCj4+Pj4NCj4+Pj4gWzFdIGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL3BpcGVybWFpbC9vcGVuc2JpLzIwMjItT2N0b2Jlci8wMDM1MjIuaHRtbA0KPj4+
DQo+Pj4gWWFoLCB0aGF0IHdhcyBhbHNvIG15IHVuZGVyc3RhbmRpbmcuIFNlZSBhbHNvIFUtQm9v
dCBtb3ZpbmcgdG8gdW5pZnkNCj4+PiB0aGVpciBjdXN0b20gYmluZGluZ3MgaW50byB0aGUgbGlu
dXggcmVwbzoNCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIw
MjIwOTMwMDAxNDEwLjI4MDI4NDMtMS1zamdAY2hyb21pdW0ub3JnLw0KPj4+DQo+Pg0KPj4gVGhp
cyBhZGRzIHRoZSBVLUJvb3Qgc3BlY2lmaWMgRFQgcHJvcGVydGllcyB0byB0aGUgZHRzIHNjaGVt
YSBpdHNlbGYsDQo+PiBub3QgTGludXgga2VybmVsIERUIGJpbmRpbmdzLg0KPiANCj4gWWVhaCwg
c29ycnkuIEkgbXVkZGxlZCB0aGluZ3MgdXAgYSBsaXR0bGUgdGhlcmUuIE15IHBvaW50IHdhcyB0
aGF0IHRoZXkNCj4gYXJlIHRyeWluZyB0byBnZXQgdG8gYSBzdGFnZSB3aGVyZSBkdC12YWxpZGF0
ZSBhbmQgdGhvc2UgdG9vbHMgd29yayBmb3INCj4gdGhlbSB0b28uIEknbSBub3Qgc3VyZSB3ZXJl
IEkgc2FpZCAibGludXggcmVwbyIgcmF0aGVyIHRoYW4gImR0LXNjaGVtYQ0KPiByZXBvIiB3aGVu
IEkgZG91YmxlIGNoZWNrZWQgdGhlIGZpbGUgcGF0aHMgaW4gdGhlIGxpbmsgYmVmb3JlIHBhc3Rp
bmcgaXQNCj4gdG8gbWFrZSBzdXJlIGl0IHdhcyB0aGUgZHQtc2NoZW1hIG9uZS4uIEkgYmxhbWUg
aXQgYmVpbmcgZWFybHkuDQo+IA0KPj4gSSBhbSBub3Qgb3Bwb3NlZCB0byBhZGRpbmcgUE1VIERU
IGJpbmRpbmdzIHRvIExpbnV4IGJ1dCB0aGVyZSBzaG91bGQNCj4+IGJlIGEgY2xlYXIgcG9saWN5
IG9uIHRoaXMuDQo+PiBXaGF0IGFib3V0IE9wZW5TQkkgZG9tYWluIERUIGJpbmRpbmdzID8NCj4+
IElmIGV2ZXJ5IG90aGVyIERUIGJhc2VkIG9wZW4gc291cmNlIHByb2plY3Qgc3RhcnRzIGFkZGlu
ZyB0aGVpciBEVA0KPj4gYmluZGluZyB0byB0aGUgTGludXgga2VybmVsLCB0aGF0IG1heSBnbyBk
b3duaGlsbCBwcmV0dHkgc29vbi4NCg0KUm9iLCBwZXJoYXBzIHlvdSBjYW4gYmUgYSBzb3VyY2Ug
b2YgY2xhcml0eSBoZXJlIDopIE15IGVhcmx5IG1vcm5pbmcNCm11ZGRsaW5nIGRpZG4ndCBoZWxw
IHRoaW5ncy4NCg0KDQo+IE1heWJlIEkgYW0gbWlzdW5kZXJzdGFuZGluZywgYnV0IEkgaGFkIHRo
b3VnaHQgdGhlIGdvYWwgd2FzIHRvIGdldCB0bw0KPiB1c2VyLWluZGVwZW5kZW50IGJpbmRpbmdz
LiBSb2IgYW5kIEtyenlzenRvZiBjZXJ0YWlubHkgbGFib3VyIHRoZSBwb2ludA0KPiB0aGF0IHRo
ZSBiaW5kaW5ncyBzaG91bGQgbm90IHJlZmxlY3QgaG93IG9uZSBvcGVyYXRpbmcgc3lzdGVtJ3Mg
ZHJpdmVycw0KPiB3b3VsZCBsaWtlIHRvIHNlZSB0aGVtICYgdS1ib290IG9yIEZyZWVCU0QgdXNp
bmcgYSBwcm9wZXJ0eSBpcyBncm91bmRzDQo+IGZvciBpdCBub3QgYmVpbmcgcmVtb3ZlZCBmcm9t
IHRoZSBiaW5kaW5ncyBpbiB0aGUgbGludXggdHJlZS4NCj4gDQo+IEknbGwgZ28gYW5kIGFjdHVh
bGx5IGFzayBSb2IuDQoNCkkgZGlkIGdvICYgYXNrIFJvYiwgdG8gd2hpY2ggaGUgc2FpZCAiSSds
bCBhcHBseSBpdCBldmVuIGlmIG5vIGRyaXZlci4iDQoNCkRvIHlvdSB3YW50IHRvIHdoaXAgdXAg
YSBiaW5kaW5nLCBvciBzaGFsbCBJPw0KDQo=

